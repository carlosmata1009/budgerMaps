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
        self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName)
        self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
        self.street = try container.decodeIfPresent(String.self, forKey: .street)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.lastCheckIn = try container.decodeIfPresent(String.self, forKey: .lastCheckIn)
        self.job = try container.decodeIfPresent(String.self, forKey: .job)
        self.company = try container.decodeIfPresent(String.self, forKey: .company)
       /* do {
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
struct CustomerDate: Decodable {
    
    let lastCheckIn: String?
    
    private enum CodingKeys: String, CodingKey{
        
        case lastCheckIn = "Last Check-In Date"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.lastCheckIn = try container.decodeIfPresent(String.self, forKey: .lastCheckIn)
    }
}
