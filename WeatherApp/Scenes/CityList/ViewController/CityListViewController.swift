//
//  CityListViewController.swift
//  WeatherApp
//
//  Created by Aymen HECHMI on 27/9/2022.
//

import UIKit

class CityListViewController: UIViewController {

    @IBOutlet weak var cityList: UITableView!
    
    private var viewModel = CityListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Weather"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        cityList.register(UINib.init(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        cityList.bindTo(viewModel.cities)
        viewModel.getMyLocationWeather()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func addTapped(){

    }

}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension CityListViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
          return viewModel.cities.value.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CityTableViewCell
        let weather = viewModel.cities.value[indexPath.row]
        cell.cityNameLbl.text = weather.name
        cell.tempLbl.text = String(format: "%.0f °C", toCelsius(kelvin: (weather.main?.temp)!))
        cell.descLbl.text = weather.weather![0].description
        cell.minMaxLbl.text = String(format: "Min.%.0f°C Max.%.0f°C", toCelsius(kelvin: (weather.main?.tempMin)!),
                                     toCelsius(kelvin: (weather.main?.tempMax)!))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cityWeatherVc = CityWeatherViewController(nibName: "CityWeatherView", bundle: nil)
        cityWeatherVc.viewModel.weather = viewModel.cities.value[indexPath.row]
        self.navigationController?.modalPresentationStyle = .currentContext
        self.navigationController?.present(cityWeatherVc, animated: true)
    }
    
}
