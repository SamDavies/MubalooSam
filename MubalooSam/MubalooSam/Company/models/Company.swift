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
import RealmSwift

class Company: Object {
    
    dynamic var ceo: User? = User()
    let teams = List<Team>()
    
    func fromJson(json: JSON) -> Company {
        
        for (_, subJson): (String, JSON) in json {
            // check if this is the json for a user
            if let _ = subJson["id"].string {
                // parse the ceo json
                ceo = ceo?.fromJson(json: subJson)
                // give the CEO his own team
                let ceoTeam = Team()
                ceoTeam.teamName = "CEO"
                ceoTeam.members.append(ceo!)
                teams.append(ceoTeam)
            } else {
                // this is the json for a team
                teams.append(Team().fromJson(json: subJson))
            }
        }
        return self
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
                        fulfill(Company().fromJson(json: SwiftyJSON.JSON(data: data)))
                    case .failure(let error):
                        print("Request failed with error: \(error)")
                        reject(error)
                    }
                }
        }
    }
}
