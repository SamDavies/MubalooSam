//
//  Team.swift
//  MubalooSam
//
//  Created by Sam Davies on 04/10/2016.
//  Copyright © 2016 Sam Davies. All rights reserved.
//

import Foundation
import SwiftyJSON

class Team {
    
    let teamName: String
    let members: [User]
    
    init(teamName: String, members: [User]) {
        self.teamName = teamName
        self.members = members
    }
    
    convenience init(json: JSON) {
        let teamName = json["teamName"].string!
        var members: [User] = []
        
        for (_, subJson): (String, JSON) in json["members"] {
            members.append(User(json: subJson))
        }
        
        self.init(teamName: teamName, members: members)
    }
}
