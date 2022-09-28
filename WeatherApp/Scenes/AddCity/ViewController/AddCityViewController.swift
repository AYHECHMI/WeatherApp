//
//  AddCityViewController.swift
//  WeatherApp
//
//  Created by Aymen HECHMI on 28/9/2022.
//

import UIKit

class AddCityViewController: UIViewController,UITextFieldDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let viewModel = AddCityViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Search City"
        tableView.register(UINib.init(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        tableView.bindTo(viewModel.cities)
        btnSearch.bindTo(viewModel.buttonEnabled)
        activityIndicator.bindTo(viewModel.isLoading)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - IBActions
    @IBAction func searchButtonPressed(_ sender: Any) {
        viewModel.searchText = txtSearch.text
        viewModel.getCityWithName()
    }
    // MARK: - textFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension AddCityViewController: UITableViewDataSource,UITableViewDelegate {
    
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
        
        let cityListVc = navigationController!.viewControllers.filter { $0 is CityListViewController }.first! as? CityListViewController
     
        cityListVc?.viewModel.cities.value.append( viewModel.cities.value[indexPath.row])
        navigationController!.popToViewController(cityListVc!, animated: true)
    }
    
}
