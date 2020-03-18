//
//  Mapper.swift
//  NSStructMapper
//
//  Created by Salmaan Ahmed on 2/4/20.
//  Copyright © 2020 Salmaan Ahmed. All rights reserved.
//


import UIKit
import Runtime

// MARK: - Swift to ObjC conversion logic
extension Mappable {
    
    public func conversionLogic<T: Storable>() throws -> T {
        do {
            let fromMirror = Mirror(reflecting: self)
            let toObject = try typeInfo(of: T.self)
            
            var nsObject = T()
            
            for mirrorProperty in fromMirror.children.enumerated() {
                let property = try toObject.property(named: mirrorProperty.element.label!)
                var valueToSet = mirrorProperty.element.value
                
                if let intEnum = ((valueToSet as AnyObject) as?  MappableIntEnum)  {
                    valueToSet = intEnum.getValue()
                } else if let stringEnum = ((valueToSet as AnyObject) as?  MappableStringEnum)  {
                    valueToSet = stringEnum.getValue()
                } else if let mappable = ((valueToSet as AnyObject) as? Mappable)  {
                    let value = try mappable.nsObject()
                    valueToSet = value as AnyObject
                } else if let mappable = ((valueToSet as AnyObject) as? [Mappable])  {
                    let value = try mappable.nsObjects()
                    valueToSet = value as AnyObject
                }
                try property.set(value: valueToSet, on: &nsObject)
            }
            
            return nsObject
            
        } catch {
            print(error)
            throw error
        }
    }
}

extension Collection where Element == Mappable {
    func nsObjects() throws -> [Storable] {
        return try self.map { try $0.nsObject() }
    }
}

// MARK: - ObjC to Swift conversion logic
extension NSMappable {
    
    public func conversionLogic<T: Mappable>() throws -> T {
        do {
            let fromMirror = Mirror(reflecting: self)
            let toObject = try typeInfo(of: T.self)
            
            var swiftObject = T()
            
            for mirrorProperty in fromMirror.children.enumerated() {
                let property = try toObject.property(named: mirrorProperty.element.label!)
                let valueToSet = mirrorProperty.element.value
                
                if let mappable = (valueToSet as AnyObject) as?  NSMappable {
                    let swiftValue = try mappable.swiftObject()
                    try property.set(value: swiftValue as Any, on: &swiftObject)
                } else if let mappable = (valueToSet as AnyObject) as?  [NSMappable] {
                    let swiftValue = try mappable.swiftObjects()
                    try property.set(value: swiftValue as Any, on: &swiftObject)
                } else if let type = try typeInfo(of: property.type).genericTypes.first, let intEnum = type as? MappableIntEnum.Type {
                    var enumValue: MappableIntEnum? = nil
                    if let value = valueToSet as? Int { enumValue = intEnum.init(value: value) }
                    try property.set(value: enumValue as Any, on: &swiftObject)
                } else if let type = try typeInfo(of: property.type).genericTypes.first, let stringEnum = type as? MappableStringEnum.Type {
                    var enumValue: MappableStringEnum? = nil
                    if let value = valueToSet as? String { enumValue = stringEnum.init(value: value) }
                    try property.set(value: enumValue as Any, on: &swiftObject)
                } else {
                    try property.set(value: valueToSet, on: &swiftObject)
                }
            }
            
            return swiftObject
            
        } catch {
            print(error)
            throw error
        }
    }
}

extension Collection where Element == NSMappable {
    func swiftObjects() throws -> [Mappable] {
        return try self.map { try $0.swiftObject() }
    }
}
