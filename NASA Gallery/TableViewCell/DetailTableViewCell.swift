//
//  DetailTableViewCell.swift
//  NASA Gallery
//
//  Created by Bindi Manek on 30/10/22.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var lblDated: UILabel!
    @IBOutlet weak var lblCopyright: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var ivNASAIMage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
