//
//  CityListViewController.swift
//  WeatherApp
//
//  Created by Aymen HECHMI on 27/9/2022.
//

import UIKit

class CityListViewController: UIViewController {

    @IBOutlet weak var cityList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Weather"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        cityList.register(UINib.init(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
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
        
          return 10
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CityTableViewCell
            return cell
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}
