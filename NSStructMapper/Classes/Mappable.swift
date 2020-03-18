//
//  Mappable.swift
//  NSStructMapper
//
//  Created by Salmaan Ahmed on 2/4/20.
//  Copyright © 2020 Salmaan Ahmed. All rights reserved.
//

import Foundation

// MARK: - Mappable Protocol
public protocol Mappable: Codable {
    init()
    func nsObject() throws -> Storable
}

// MARK: - Mappable Int Enum
public protocol MappableIntEnum: Codable {
    func getValue() -> Int
    init(value: Int)
}

// MARK: - Mappable String Enum
public protocol MappableStringEnum: Codable {
    func getValue() -> String
    init(value: String)
}

// MARK: - NSMappable Protocol
public protocol NSMappable {
    func swiftObject() throws -> Mappable
}

// MARK: - Storable Protocol
public protocol Storable {
    init()
}

extension NSObject: Storable { }
