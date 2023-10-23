//
//  ExpandableCell.swift
//  expandableCellDemo
//
//  Created by Itsuki on 2023/10/23.
//

import UIKit

class ExpandableCell: UITableViewCell {
    static let cellIdentifier = String(describing: ExpandableCell.self)
    

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
        
}

    

