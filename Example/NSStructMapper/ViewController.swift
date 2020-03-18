//
//  ViewController.swift
//  NSStructMapper
//
//  Created by salmaan.ahmed@hotmail.com on 03/18/2020.
//  Copyright (c) 2020 salmaan.ahmed@hotmail.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var addresses = [
        Address(city: "Islamabad", zipCode: "44000"),
        Address(city: "Rawalpindi", zipCode: "44000"),
        Address(city: "Lahore", zipCode: "46900") ]
    
    var phoneNumbers = [22456934, 45871269, 39748145]
    
    var contact: Contact {
        Contact(id: 1943,
                email: "salmaan.ahmed0@hotmail.com",
                password: "******",
                phoneNumbers: phoneNumbers,
                gender: .male,
                passwordChanged: true,
                locationSharingMode: .always,
                primaryAddress: addresses.first,
                addresses: addresses)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Convert to NSObject as follows
        let nsContact: NSContact = try! contact.nsObject() as! NSContact
        
        // Convert to Swift Object as follows
        let swiftContact: Contact = try! nsContact.swiftObject() as! Contact
        
        print(nsContact)
        print(swiftContact)
    }
}
