//
//  CustomerView.swift
//  BudgerMaps
//
//  Created by Carlos Mata on 2/12/23.
//

import SwiftUI

struct CustomerView: View {
    let customer: Customer
    var body: some View {
        VStack(alignment: .leading){
            Text("**First Name**: \(customer.firstName ?? "null")")
            Text("**Last Name**: \(customer.lastName ?? "null")")
            Text("**Street**: \(customer.street ?? "null")")
            //Text("**Zip**: \(customer.zip)")
            Text("**City**: \(customer.city ?? "null")")
            Text("**Type**: \(customer.type ?? "null")")
            Text("**Last check in**: \(customer.lastCheckIn ?? "null")")
            Text("**Job**: \(customer.job ?? "null")")
            //Text("**Phone**: \(customer.phone)")
            Text("**Company**: \(customer.company ?? "null")")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 10, style:  .continuous))
        .padding(.horizontal, 4)
    }
}
