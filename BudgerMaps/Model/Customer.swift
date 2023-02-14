//
//  Customer.swift
//  BudgerMaps
//
//  Created by Carlos Mata on 2/12/23.
//

import Foundation

struct Customer: Decodable {
    let firstName: String?
    let lastName: String?
    let street: String?
    //let zip: String?
    let city: String?
    let type: String?
    let lastCheckIn: String?
    let job: String?
    //let phone: String?
    let company: String?

    private enum CodingKeys: String, CodingKey{
        case firstName = "First Name"
        case lastName = "Last Name"
        case street = "Street"
        // case zip = "Zip"
        case city = "City"
        case type = "Type"
        case lastCheckIn = "Last Check-In Date"
        case job = "Job"
        //case phone = "Phone"
        case company = "Company"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName) ?? "null"
        self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName) ?? "null"
        self.street = try container.decodeIfPresent(String.self, forKey: .street) ?? "null"
        self.city = try container.decodeIfPresent(String.self, forKey: .city) ?? "null"
        self.type = try container.decodeIfPresent(String.self, forKey: .type) ?? "null"
        self.lastCheckIn = try container.decodeIfPresent(String.self, forKey: .lastCheckIn) ?? "null"
        self.job = try container.decodeIfPresent(String.self, forKey: .job) ?? "null"
        self.company = try container.decodeIfPresent(String.self, forKey: .company) ?? "null"
       /*Trying to catch if my value is an int, string or null value, but its not working yet. Because of null values.
        do {
            phone = try String(container.decode(Int.self, forKey: .phone))
        } catch DecodingError.typeMismatch{
            phone = try container.decodeIfPresent(String.self, forKey: .phone)
        } catch DecodingError.typeMismatch{
            phone = try container.decodeIfPresent(nil, forKey: .phone)
        }
        do {
            zip = try String(container.decode(Int.self, forKey: .zip))
        } catch DecodingError.typeMismatch{
            zip = try container.decodeIfPresent(String.self, forKey: .zip)
        }
        */
        
    }
}
