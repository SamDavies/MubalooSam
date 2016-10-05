//
//  UserDetailCtrl.swift
//  MubalooSam
//
//  Created by Sam Davies on 05/10/2016.
//  Copyright © 2016 Sam Davies. All rights reserved.
//

import UIKit
import ReSwift

class UserDetailCtrl: UIViewController, StoreSubscriber {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barStyle = .black
    }
}

//MARK: Main Redux Methods

extension UserDetailCtrl {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainStore.subscribe(self) { state in
            state.companyState
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mainStore.unsubscribe(self)
    }
    
    func newState(state: CompanyState) {
        if let selectedTeam = state.selectedTeam {
            self.navigationItem.title = selectedTeam.teamName
        }
        
        if let selectedUser = state.selectedUser {
            name.text = "\(selectedUser.firstName) \(selectedUser.lastName)"
            role.text = selectedUser.role
            
            self.profileImage.kf.setImage(with: URL(string: selectedUser.profileImageURL)!, placeholder: UIImage(named: "default.jpg"))
        }
    }
}
