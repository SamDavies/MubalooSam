//
//  CompanyActions.swift
//  MubalooSam
//
//  Created by Sam Davies on 04/10/2016.
//  Copyright © 2016 Sam Davies. All rights reserved.
//

import Foundation
import ReSwift
import RealmSwift

func getCompanyFromWeb(state: AppState, store: Store<AppState>) -> Action? {
    Company.getCompany().then {
        company -> Void in
        // save the company to disk
        let realm = try! Realm()
        try! realm.write {
            realm.add(company)
        }
        
        store.dispatch(SetCompany(company: company))
    }
    return nil
}

func getCompanyFromDisk(state: AppState, store: Store<AppState>) -> Action? {
    let realm = try! Realm()
    if let company = realm.objects(Company.self).first {
        store.dispatch(SetCompany(company: company))
    }
    return nil
}

struct SetCompany: Action {
    let company: Company
}

struct SetSelectedUser: Action {
    let selectedUser: User
}

struct SetSelectedTeam: Action {
    let selectedTeam: Team
}

