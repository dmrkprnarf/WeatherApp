//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Arif Demirkoparan on 18.01.2023.
//

import Foundation

struct WeatherData:Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    let sys:Sys
    
}

struct Main:Codable {
    let temp: Double
}

struct Weather:Codable {
    let id: Int
    let main: String
    let description: String
    let icon:String
}

struct Sys:Codable {
    let country:String
}
