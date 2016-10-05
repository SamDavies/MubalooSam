//
//  CompanyReducer.swift
//  MubalooSam
//
//  Created by Sam Davies on 04/10/2016.
//  Copyright © 2016 Sam Davies. All rights reserved.
//

import Foundation
import ReSwift

struct CompanyState: StateType {
    var company: Company?
    var selectedUser: User?
    var selectedTeam: Team?
}


func companyReducer(action: Action, state: CompanyState?) -> CompanyState {
    var state = state ?? CompanyState(
        company: nil,
        selectedUser: nil,
        selectedTeam: nil
    )
    
    switch action {
    case let action as SetCompany:
        state.company = action.company
        return state
    case let action as SetSelectedUser:
        state.selectedUser = action.selectedUser
        return state
    case let action as SetSelectedTeam:
        state.selectedTeam = action.selectedTeam
        return state
    default:
        return state
    }
}
