//
//  Constant.swift
//  Register
//
//  Created by Trương Thắng on 3/13/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import Foundation


struct NotificationKey {
    static var didUpdateCities = Notification.Name.init("didUpdateCities")
    static var didUpdateDistricts = Notification.Name.init("didUpdateDistricts")
}

struct SegueIdentifier {
    static var showDistrict = "showDistrict"
}
