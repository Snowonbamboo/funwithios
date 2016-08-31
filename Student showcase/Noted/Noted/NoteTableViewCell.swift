//
//  NoteTableViewCell.swift
//  Noted
//
//  Created by student on 8/18/16.
//  Copyright © 2016 HarlanAltepeter. All rights reserved.
//

import UIKit
import Foundation

class NoteTableViewCell : UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
   
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}