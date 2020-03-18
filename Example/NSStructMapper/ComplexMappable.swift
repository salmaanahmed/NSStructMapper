//
//  ComplexMappable.swift
//  NSStructMapper
//
//  Created by Salmaan Ahmed on 3/18/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import NSStructMapper

// MARK: - Swift Contact
struct Contact: Mappable {
    var id: Int?
    var email: String?
    var password: String?
    var phoneNumbers: [Int]?
    var gender: Gender?
    var passwordChanged: Bool?
    var locationSharingMode: LocationSharingMode?
    var primaryAddress: Address?
    var addresses: [Address]?
    
    // Implement this method like following
    func nsObject() throws -> Storable {
        let result: NSContact = try conversionLogic()
        return result
    }
}

// MARK: - Swift Equivalent ObjC Contact
@objc class NSContact: NSObject, NSMappable {
    @objc var id: NSNumber?
    @objc var email: String?
    @objc var password: String?
    @objc var phoneNumbers: [NSNumber]?
    @objc var gender: NSNumber?
    @objc var passwordChanged: Bool = false
    @objc var locationSharingMode: String?
    @objc var primaryAddress: NSAddress?
    @objc var addresses: [NSAddress]?
    
    // Implement this method like following
    func swiftObject() throws -> Mappable {
        let result: Contact = try conversionLogic()
        return result
    }
}
