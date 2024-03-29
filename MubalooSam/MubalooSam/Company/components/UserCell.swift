//
//  UserCell.swift
//  MubalooSam
//
//  Created by Sam Davies on 04/10/2016.
//  Copyright © 2016 Sam Davies. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

class UserCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    var user: User?
    
    func render(user: User) {
        self.user = user
        name.text = "\(user.firstName) \(user.lastName)"
        role.text = user.role
        
        self.profileImage.kf.setImage(with: URL(string: user.profileImageURL)!, placeholder: UIImage(named: "default.jpg"))
        
        if user.teamLead {
            self.backgroundColor = UIColor(red: 0.99, green: 1.0, blue: 0.698, alpha: 1.0)
        } else {
            self.backgroundColor = UIColor.white
        }
    }
}
