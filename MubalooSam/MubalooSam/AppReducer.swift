//
//  AppReducer.swift
//  MubalooSam
//
//  Created by Sam Davies on 04/10/2016.
//  Copyright © 2016 Sam Davies. All rights reserved.
//

import ReSwift

struct AppState: StateType {
    var companyState: CompanyState
}

struct AppReducer: Reducer {
    func handleAction(action: Action, state: AppState?) -> AppState {
        return AppState(
            companyState: companyReducer(action: action, state: state?.companyState)
        )
    }
}
