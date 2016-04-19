//
//  JokeCellTableViewCell.swift
//  ShopGames
//
//  Created by Fahid_Alothman on 4/16/16.
//  Copyright © 2016 Fahid Othman. All rights reserved.
//



import UIKit

class JokeCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var jokeText: UITextView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var totalVotesLabel: UILabel!
    @IBOutlet weak var thumbVoteImage: UIImageView!
    
        override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
