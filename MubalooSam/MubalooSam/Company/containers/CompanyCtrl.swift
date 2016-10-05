//
//  CompanyCtrl.swift
//  MubalooSam
//
//  Created by Sam Davies on 04/10/2016.
//  Copyright © 2016 Sam Davies. All rights reserved.
//

import UIKit
import PromiseKit
import ReSwift

class CompanyCtrl: UIViewController, StoreSubscriber, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table.dataSource = self
        self.table.delegate = self
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(CompanyCtrl.getInitialData), for: UIControlEvents.valueChanged)
        self.table.addSubview(refreshControl)
        
        navigationController?.navigationBar.barStyle = .black
    }
}

//MARK: Main Redux Methods

extension CompanyCtrl {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainStore.subscribe(self) { state in
            state.companyState
        }
        self.getInitialData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mainStore.unsubscribe(self)
    }
    
    func getInitialData() {
        mainStore.dispatch(getCompanyFromDisk)
        mainStore.dispatch(getCompanyFromWeb)
    }
    
    func newState(state: CompanyState) {
        self.reloadCells()
    }
}

//MARK: Table view methods

extension CompanyCtrl {
    
    func reloadCells() {
        DispatchQueue.main.async {
            self.table!.reloadData()
            self.refreshControl?.endRefreshing()
        }
    }
    
    // number of sections
    @objc(numberOfSectionsInTableView:) func numberOfSections(in tableView: UITableView) -> Int {
        if let company = mainStore.state.companyState.company {
            return company.teams.count
        }
        return 0
    }
    
    // number of cells in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let company = mainStore.state.companyState.company {
            return company.teams[section].members.count
        }
        return 0
    }
    
    // section header title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mainStore.state.companyState.company!.teams[section].teamName
    }
    
    // section header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48.0
    }
    
    // section header cell
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = table.dequeueReusableCell(withIdentifier: "TeamHeaderCell") as! TeamHeaderCell
        let company = mainStore.state.companyState.company!
        cell.render(team: company.teams[section])
        cell.selectionStyle = .none
        return cell
    }
    
    // cell at index
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "UserCell") as! UserCell
        let company = mainStore.state.companyState.company!
        cell.render(user: company.teams[indexPath.section].members[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    // selection of cell
    @objc(tableView:didSelectRowAtIndexPath:) func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let company = mainStore.state.companyState.company!
        let team = company.teams[indexPath.section]
        let user = team.members[indexPath.row]
        mainStore.dispatch(SetSelectedUser(selectedUser: user))
        mainStore.dispatch(SetSelectedTeam(selectedTeam: team))
        self.performSegue(withIdentifier: "UserDetail", sender: self)
    }
    
}
