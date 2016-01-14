//
//  Employee.swift
//  test
//
//  Created by System Administrator on 24.12.15.
//  Copyright (c) 2015 DIS. All rights reserved.
//

import Foundation

class Employee : ROJSONObject {
    
    required init() {
        super.init();
    }
    
    required init(jsonData:AnyObject) {
        super.init(jsonData: jsonData)
    }
    
    var type:String {
        return Value<String>.get(self, key: "type")
    }
    
    var tech:String {
        return Value<String>.get(self, key: "tech")
    }
    
    var flag:String {
        return Value<String>.get(self, key: "flag")
    }
    
    var id:String {
        return Value<String>.get(self, key: "id")
    }
    
    var name:String {
        return Value<String>.get(self, key: "name")
    }
    
    var date:String {
        return Value<String>.get(self, key: "date")
    }
    
    var status:String {
        return Value<String>.get(self, key: "status")
    }
    
    var technic:String {
        return Value<String>.get(self, key: "technic")
    }
    
    var who:String {
        return Value<String>.get(self, key: "who")
    }
    
    var address:String {
        return Value<String>.get(self, key: "address")
    }
    
    var loc_x:String {
        return Value<String>.get(self, key: "loc_x")
    }
    
    var loc_y:String {
        return Value<String>.get(self, key: "loc_y")
    }
    
    var image_url:String {
        return Value<String>.get(self, key: "image_url")
    }
    // type tech flag id name date status technic who address loc_x loc_y image_url
}