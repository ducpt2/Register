//
//  SelectDistrictTableVC.swift
//  Register
//
//  Created by Trương Thắng on 3/13/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import UIKit

class SelectDistrictTableVC: BaseTableVC {
    var cityCode : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        if cityCode != 0 {
            data = DataServices.shared.districts.filter({ (district) -> Bool in
                return district.codeCity == self.cityCode
            })
        }
        registerNotification()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: NotificationKey.didUpdateDistricts, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    func handleNotification(_ notification: Notification) {
        data = DataServices.shared.districts
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
