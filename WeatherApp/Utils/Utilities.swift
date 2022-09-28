//
//  Utilities.swift
//  WeatherApp
//
//  Created by Aymen HECHMI on 28/9/2022.
//

import Foundation

internal let FahrenheitKelvin = -459.67
internal let KelvinCelsius = 273.15


public func toCelsius(kelvin: Double) -> Double {
    return kelvin - KelvinCelsius
}

func toFahrenheit(celsius: Double) -> Double {
    return celsius * 9 / 5 + 32
}
