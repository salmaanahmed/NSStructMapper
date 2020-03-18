//
//  SimpleMappable.swift
//  NSStructMapper
//
//  Created by Salmaan Ahmed on 3/18/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import NSStructMapper

// MARK: - Swift Address
struct Address: Mappable {
    var city: String?
    var zipCode: String?
    
    // Implement this method like following
    func nsObject() throws -> Storable {
        let result: NSAddress = try conversionLogic()
        return result
    }
}

// MARK: - Swift Equivalent ObjC Address
@objc class NSAddress: NSObject, NSMappable {
    var city: String?
    var zipCode: String?
    
    // Implement this method like following
    func swiftObject() throws -> Mappable {
        let result: Address = try conversionLogic()
        return result
    }
}
