//
//  CityListViewModel.swift
//  WeatherApp
//
//  Created by Aymen HECHMI on 27/9/2022.
//

import Foundation
import CoreLocation
import WeatherLibrary

class CityListViewModel{
    
    let weatherApi = WeatherLibrary(apiKey:API_KEY)
    let cities: Dynamic<[Weather]> = Dynamic([])
    let isLoading: Dynamic<Bool> = Dynamic(false)
    
    func getMyLocationWeather()  {
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
                CLLocationManager.authorizationStatus() ==  .authorizedAlways
        {
            weatherApi.getWeatherForLocation(location: locationManager.location!){ result in
                switch result {
                case .success(let weather):
                    self.isLoading.value = false
                    self.cities.value.append(contentsOf: [weather])
                case .error(_):
                    self.isLoading.value = false
                    break
                }
            }
        }
        
    }
}
