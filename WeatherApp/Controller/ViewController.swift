//
//  ViewController.swift
//  WeatherApp
//
//  Created by Arif Demirkoparan on 17.01.2023.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,WeatherMenagerDelegate{
   

    @IBOutlet weak var searcBar: UITextField!
    @IBOutlet weak var weatgerİmage: UIImageView!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
     var weatherMenager = WeatherMenager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searcBar.delegate = self
        weatherMenager.delegate = self

    }

    @IBAction func locationPressed(_ sender: UIButton) {

    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        searcBar.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searcBar.endEditing(true)
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
         
        if textField.text != "" {
            return true
        }else {
            searcBar.placeholder = "Değer Girmediniz."
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searcBar.text {
            weatherMenager.fetchWeather(cityName: city)
        }
        searcBar.text = ""
    }
    
    func didUpdateMenager(weather: WeatherModel) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.degreeLabel.text = weather.tempatureString
            self.weatgerİmage.image = UIImage(systemName: weather.conditionName)
            self.countryLabel.text = weather.country
        }
    }
    
    func didFailWithError(error: Error) {
        print(error.localizedDescription)
    }
    
}

