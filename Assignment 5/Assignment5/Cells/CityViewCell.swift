//
//  CityViewCell.swift
//  Assignment5
//
//  Created by Ekrem Yiğiter on 30.11.2021.
//

import UIKit

class CityViewCell: UITableViewCell {
    
  
    @IBOutlet weak var cityName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
