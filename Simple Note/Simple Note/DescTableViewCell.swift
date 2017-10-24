//
//  DescTableViewCell.swift
//  Simple Note
//
//  Created by Muhammad Hilmy Fauzi on 24/10/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class DescTableViewCell: UITableViewCell {

    @IBOutlet weak var labelDay: UILabel!
    @IBOutlet weak var labelTask: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
