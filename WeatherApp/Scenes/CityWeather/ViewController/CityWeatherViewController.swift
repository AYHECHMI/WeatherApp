//
//  CityWeatherViewController.swift
//  WeatherApp
//
//  Created by Aymen HECHMI on 28/9/2022.
//

import UIKit

class CityWeatherViewController: UIViewController {
    
    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var pressureLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var windLbl: UILabel!
    
    let viewModel = CityWeatherViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cityNameLbl.text = viewModel.weather?.name
        descLbl.text = viewModel.weather?.weather?[0].description!.uppercased()
        tempLbl.text = String(format: "%.0f °C", toCelsius(kelvin: (viewModel.weather?.main?.temp)!))
        windLbl.text = String(format: "%.0f mph",  (viewModel.weather?.wind?.speed)!)
        pressureLbl.text = String(format: "%.0f inHg",  (viewModel.weather?.main?.pressure)!)
        humidityLbl.text = String(format: "%d%%",(viewModel.weather?.main?.humidity)!)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
