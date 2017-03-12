//
//  DataServices.swift
//  Register
//
//  Created by Trương Thắng on 3/12/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import Foundation

class DataServices {
    static let shared : DataServices = DataServices()
    private var _cities: [City] = []
    
    var cities: [City] {
        set {
            _cities = newValue
        }
        get {
            if _cities.count == 0 {
                updateCities()
            }
            return _cities
        }
    }
    
    func updateCities() {
        _cities.removeAll()
        let fileName = "Cities.plist"
        guard let root = PlistServices().getDictionaryFrom(plist: fileName) else {
            return
        }
        guard let cityDictionaries = root["Cities"] as? [Dictionary<AnyHashable, Any>]else {return}
        
        for dict in cityDictionaries {
            if let city = City(dict: dict) {
                _cities.append(city)
            }
        }
    }
    
}

struct City {
    var name = ""
    var code = 0
    
    init?(name: String, code: Int) {
        guard code > 0 else { return nil }
        guard name != "" else { return nil }
        self.name = name
        self.code = code
    }
    
    init?(dict: Dictionary<AnyHashable, Any>) {
        guard let name = dict["Name"] as? String else {return nil}
        guard let code = dict["CityCode"] as? Int else {return nil}
        self.init(name: name, code: code)
    }
    
}
