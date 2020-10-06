//
//  OffersTableViewCell.swift
//  Offers
//
//  Created by Abdelrahman Sobhy on 10/6/20.
//  Copyright © 2020 Abdelrahman Sobhy. All rights reserved.
//

import UIKit

class OffersTableViewCell: UITableViewCell {

    //MARK:- Outelts
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var lblFavCount: UILabel!
    @IBOutlet weak var lblTags: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
