//
//  EnumMappable.swift
//  NSStructMapper
//
//  Created by Salmaan Ahmed on 3/18/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import NSStructMapper

// MARK: - Swift String Enum
enum LocationSharingMode: String, Codable, MappableStringEnum {
    case always
    case onlyAtFamilyPlaces
    case never
    case other
    
    // Implement this method like following
    init(value: String) {
        self = LocationSharingMode.init(rawValue: value) ?? .other
    }
    
    // Implement this method like following
    func getValue() -> String {
        return self.rawValue
    }
    
}

// MARK: - Swift Int Enum
enum Gender: Int, Codable, MappableIntEnum {
    case male
    case female
    case other
    
    // Implement this method like following
    init(value: Int) {
        self = Gender.init(rawValue: value) ?? .other
    }
    
    // Implement this method like following
    func getValue() -> Int {
        return self.rawValue
    }
}
