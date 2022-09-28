//
//  CityTableViewCell.swift
//  WeatherApp
//
//  Created by Aymen HECHMI on 27/9/2022.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var minMaxLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
