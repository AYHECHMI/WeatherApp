//
//  AddCityViewModel.swift
//  WeatherApp
//
//  Created by Aymen HECHMI on 28/9/2022.
//

import Foundation
import WeatherLibrary

class AddCityViewModel{
    
    let weatherApi = WeatherLibrary(apiKey:API_KEY)
    let cities: Dynamic<[Weather]> = Dynamic([])
    let isLoading: Dynamic<Bool> = Dynamic(false)
    let buttonEnabled: Dynamic<Bool> = Dynamic(false)
    
    var searchText: String? = nil {
        didSet { buttonEnabled.value = getEnabledFlowStatus() }
    }
    
    func getCityWithName()  {
        
        weatherApi.getWeatherForCityName(name: searchText!){ result in
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

private extension AddCityViewModel {
    func getEnabledFlowStatus() -> Bool {
        guard let gSearchText = searchText else { return false }
        return gSearchText.count >= 3
    }
}
