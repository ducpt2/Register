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
        NotificationCenter.default.post(name: NotificationKey.didUpdateCities, object: nil)
    }
    
    private var _districts: [District] = []
    
    var districts: [District] {
        set {
            _districts = newValue
        }
        get {
            if _districts.count == 0 {
                updateDistricts()
            }
            return _districts
        }
    }
    
    func updateDistricts() {
        _districts.removeAll()
        let fileName = "Districts.plist"
        guard let root = PlistServices().getDictionaryFrom(plist: fileName) else {
            return
        }
        guard let cityDictionaries = root["Districts"] as? [Dictionary<AnyHashable, Any>]else {return}
        
        for dict in cityDictionaries {
            if let district = District(dict: dict) {
                _districts.append(district)
            }
        }
        NotificationCenter.default.post(name: NotificationKey.didUpdateDistricts, object: nil)
    }

    
}
