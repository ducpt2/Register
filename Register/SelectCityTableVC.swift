//
//  SelectCityTableVC.swift
//  Register
//
//  Created by Trương Thắng on 3/13/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import UIKit

class SelectCityTableVC: BaseTableVC {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNotification()
        data = DataServices.shared.cities

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: NotificationKey.didUpdateCities, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    func handleNotification(_ notification: Notification) {
        data = DataServices.shared.cities
        tableView.reloadData()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case SegueIdentifier.showDistrict:
            guard let vc = segue.destination as? SelectDistrictTableVC else {
                return
            }
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
                return
            }
            if let selectedCityCode = (data[selectedIndexPath.row] as? City)?.code {
                vc.cityCode = selectedCityCode
            }
            
        default:
            return
        }
    }
    

   
}
