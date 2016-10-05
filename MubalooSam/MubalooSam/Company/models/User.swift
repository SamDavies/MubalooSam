//
//  User.swift
//  MubalooSam
//
//  Created by Sam Davies on 04/10/2016.
//  Copyright © 2016 Sam Davies. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class User: Object {
    
    dynamic var id: String = ""
    dynamic var firstName: String = ""
    dynamic var lastName: String = ""
    dynamic var role: String = ""
    dynamic var profileImageURL: String = ""
    dynamic var teamLead: Bool = false
    
    func fromJson(json: JSON) -> User {
        id = json["id"].string!
        firstName = json["firstName"].string!
        lastName = json["lastName"].string!
        role = json["role"].string!
        profileImageURL = json["profileImageURL"].string!
        teamLead = json["firstName"].bool ?? false
        return self
    }
}

