//
//  User.swift
//  MubalooSam
//
//  Created by Sam Davies on 04/10/2016.
//  Copyright © 2016 Sam Davies. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    
    let id: String
    let firstName: String
    let lastName: String
    let role: String
    let profileImageURL: String
    let teamLead: Bool
    
    init(id: String, firstName: String, lastName: String, role: String, profileImageURL: String, teamLead: Bool) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.role = role
        self.profileImageURL = profileImageURL
        self.teamLead = teamLead
    }
    
    convenience init(json: JSON) {
        let id = json["id"].string!
        let firstName = json["firstName"].string!
        let lastName = json["lastName"].string!
        let role = json["role"].string!
        let profileImageURL = json["profileImageURL"].string!
        let teamLead = json["firstName"].bool ?? false
        
        self.init(id: id, firstName: firstName, lastName: lastName, role: role, profileImageURL: profileImageURL, teamLead: teamLead)
    }
}

