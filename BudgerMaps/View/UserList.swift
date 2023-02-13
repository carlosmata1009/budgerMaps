//
//  UserList.swift
//  BudgerMaps
//
//  Created by Carlos Mata on 2/13/23.
//

import SwiftUI

struct UserList: View {
    @StateObject private var cvm = CustomersViewModel()
    var body: some View {
        
        NavigationView{
            ZStack {
                
                List{
                    ForEach(cvm.customers, id: \.firstName){ customer in
                        CustomerView(customer: customer)
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Customers sort by job")
                .alert(isPresented: $cvm.hasError, error: cvm.error){
                    Text("Retry")
                }
            }
        }
        .onAppear(perform: cvm.fetchCustomers)
    }
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        UserList()
    }
}
