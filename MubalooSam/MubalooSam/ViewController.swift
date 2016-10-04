//
//  ViewController.swift
//  MubalooSam
//
//  Created by Sam Davies on 04/10/2016.
//  Copyright © 2016 Sam Davies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Company.getCompany().then {
            company -> Void in
            print("hello")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

