//
//  EmployeeContainer.swift
//  test
//
//  Created by System Administrator on 24.12.15.
//  Copyright (c) 2015 DIS. All rights reserved.
//

import Foundation

class EmployeeContainer : ROJSONObject {
    required init() {
        super.init();
    }
    
    required init(jsonData:AnyObject) {
        super.init(jsonData: jsonData)
    }
    
    lazy var employees:[Employee] = {
        return Value<[Employee]>.getArray(self, key: "data") as [Employee]
        }()
}