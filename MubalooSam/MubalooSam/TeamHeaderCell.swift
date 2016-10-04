//
//  TeamHeaderCell.swift
//  MubalooSam
//
//  Created by Sam Davies on 04/10/2016.
//  Copyright © 2016 Sam Davies. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

class TeamHeaderCell: UITableViewCell {
    
    @IBOutlet weak var teamName: UILabel!
    var team: Team?
    
    func render(team: Team) {
        self.team = team
        teamName.text = team.teamName
    }
}
