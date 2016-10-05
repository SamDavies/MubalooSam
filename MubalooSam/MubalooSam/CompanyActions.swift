//
//  CompanyActions.swift
//  MubalooSam
//
//  Created by Sam Davies on 04/10/2016.
//  Copyright © 2016 Sam Davies. All rights reserved.
//

import Foundation
import ReSwift

func getCompanyFromWeb(state: AppState, store: Store<AppState>) -> Action? {
    Company.getCompany().then {
        company -> Void in
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

