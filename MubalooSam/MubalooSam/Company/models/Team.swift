//
//  Team.swift
//  MubalooSam
//
//  Created by Sam Davies on 04/10/2016.
//  Copyright © 2016 Sam Davies. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class Team: Object {
    
    dynamic var teamName: String = ""
    let members = List<User>()
    
    func fromJson(json: JSON) -> Team {
        teamName = json["teamName"].string!
        
        for (_, subJson): (String, JSON) in json["members"] {
            members.append(User().fromJson(json: subJson))
        }
        return self
    }
}
