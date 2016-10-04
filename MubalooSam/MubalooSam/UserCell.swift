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
        
//        self.profileImage.kf_setImageWithURL(NSURL(string: user.profileImageURL)!, placeholderImage: UIImage(named: "default.jpg"))
    }
}
