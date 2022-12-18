//
//  KelimeHücreTableViewCell.swift
//  Sözlük Uygulaması
//
//  Created by Hüdahan Altun on 8.07.2022.
//

import UIKit

class KelimeHu_creTableViewCell: UITableViewCell {

    @IBOutlet weak var ingilizceLabel: UILabel!
    
    @IBOutlet weak var türkceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
