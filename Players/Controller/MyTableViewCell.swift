//
//  MyTableViewCell.swift
//  Players
//
//  Created by Anu on 07/09/21.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    static let identifier = "MyTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }

    @IBOutlet var label: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    func configure (with title : String){
        label.set
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
