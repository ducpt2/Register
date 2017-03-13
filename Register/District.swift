//
//  District.swift
//  Register
//
//  Created by Trương Thắng on 3/13/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import Foundation

struct District: PlaceProtocol {
    var codeCity = 0
    var codeDistrict = 0
    var name = ""
    
    init?(name: String, codeCity: Int, codeDistrict: Int) {
        guard codeCity > 0 else { return nil }
        guard codeDistrict > 0 else { return nil }
        guard name != "" else { return nil }
        self.name = name
        self.codeCity = codeCity
        self.codeDistrict = codeDistrict
    }
    
    init?(dict: Dictionary<AnyHashable, Any>) {
        guard let name = dict["Name"] as? String else {return nil}
        guard let codeCity = dict["CityCode"] as? Int else {return nil}
        guard let codeDistrict = dict["DistrictCode"] as? Int else {return nil}
        self.init(name: name, codeCity: codeCity, codeDistrict: codeDistrict)
    }
    
}

