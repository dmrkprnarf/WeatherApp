//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Arif Demirkoparan on 18.01.2023.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName:String
    let tempature:Double
    let country: String
    
    
    var conditionName:String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 800...804:
            return "cloud.bolt"

        default:
          return "cloud"
        }
    }

    var tempatureString: String {
        return String(format: "%.f", tempature)
    }
}
