import XCTest
import NSStructMapper

class Tests: XCTestCase {

    var addresses = [
        Address(city: "Islamabad", zipCode: "44000"),
        Address(city: "Rawalpindi", zipCode: "44000"),
        Address(city: "Lahore", zipCode: "46900") ]
    
    var phoneNumbers = [22456934, 45871269, 39748145]
    
    var contact: Contact {
        Contact(id: 1943,
                email: "salmaan@hotmail.com",
                password: "******",
                phoneNumbers: phoneNumbers,
                gender: .male,
                passwordChanged: true,
                locationSharingMode: .always,
                primaryAddress: addresses.first,
                addresses: addresses)
    }
    
    var convertedNSContact: NSContact!
    
    override func setUp() {
        super.setUp()
        convertedNSContact = try? contact.nsObject() as! NSContact
    }

    
    func testChildObjectArraySize() {
        XCTAssertEqual(convertedNSContact.phoneNumbers?.count, contact.phoneNumbers?.count)
    }
    
    func testIntegerToNSNumber() {
        XCTAssertEqual(convertedNSContact.id, contact.id as NSNumber?)
    }
    
    func testStringToString() {
        XCTAssertEqual(convertedNSContact.email, contact.email)
    }
    
    func testArrayToNSArray() {
        XCTAssertEqual(convertedNSContact.phoneNumbers, contact.phoneNumbers as [NSNumber]?)
    }
    
    func testEnumToNSNumber() {
        XCTAssertEqual(convertedNSContact.gender, contact.gender.map { NSNumber(value: $0.rawValue) })
    }
    
    func testBoolToBool() {
        XCTAssertEqual(convertedNSContact.passwordChanged, contact.passwordChanged)
    }
    
    func testEnumToString() {
        XCTAssertEqual(convertedNSContact.locationSharingMode, contact.locationSharingMode.map { $0.rawValue })
    }
    
    func testNestedObject() {
        XCTAssertEqual(convertedNSContact.primaryAddress?.city, contact.primaryAddress?.city)
    }
    
    func testNestedObjectArray() {
        XCTAssertEqual(convertedNSContact.addresses?.first?.city, contact.addresses?.first?.city)
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
