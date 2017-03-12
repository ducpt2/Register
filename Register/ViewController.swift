//
//  ViewController.swift
//  Register
//
//  Created by Trương Thắng on 3/12/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let _ = DataServices.shared.cities
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

