//
//  ModelTableViewCell.swift
//  WekanActionSheet
//
//  Created by Brian on 08/04/20.
//  Copyright © 2020 Wekan. All rights reserved.
//

import UIKit

class ModelTableViewCell: UITableViewCell {

    @IBOutlet weak var lblModelName: UILabel!

    // MARK: - Awake from nib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Set selected
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
