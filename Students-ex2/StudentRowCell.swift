//
//  StudentRowCell.swift
//  Students-ex2
//
//  Created by admin on 30/11/2017.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class StudentRowCell: UITableViewCell {

    
    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
