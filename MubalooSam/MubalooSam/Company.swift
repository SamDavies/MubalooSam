//
//  Company.swift
//  MubalooSam
//
//  Created by Sam Davies on 04/10/2016.
//  Copyright © 2016 Sam Davies. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON

class Company {
    
    let ceo: User
    let teams: [Team]
    
    init(ceo: User, teams: [Team]) {
        self.ceo = ceo
        self.teams = teams
    }
    
    convenience init(json: JSON) {
        var ceo: User?
        var teams: [Team] = []
        
        for (_, subJson): (String, JSON) in json {
            // check if this is the json for a user
            if let _ = subJson["id"].string {
                // parse the ceo json
                ceo = User(json: subJson)
            } else {
                // this is the json for a team
                teams.append(Team(json: subJson))
            }
        }
        
        self.init(ceo: ceo!, teams: teams)
    }
}

extension Company {
    
    static func getCompany() -> Promise<Company> {
        return Promise {
            fulfill, reject in
            Alamofire.request("http://developers.mub.lu/resources/team.json")
                .validate(statusCode: 200..<300)
                .responseData {
                    response in
                    switch response.result {
                    case .success(let data):
                        fulfill(Company(json: SwiftyJSON.JSON(data: data)))
                    case .failure(let error):
                        print("Request failed with error: \(error)")
                        reject(error)
                    }
                }
        }
    }
}
