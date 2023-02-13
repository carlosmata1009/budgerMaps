//
//  ContentView.swift
//  BudgerMaps
//
//  Created by Carlos Mata on 2/12/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    NavigationLink(destination: EarlyCheck()){
                        TextButton(text:"First\n customer".uppercased())
                    }
                    NavigationLink(destination: LastestCheck()){
                        TextButton(text:"Last\n  customer".uppercased())
                        
                    }
                }
                HStack{
                    NavigationLink(destination: UserList()){
                        TextButton(text:"List of \ncustomers ".uppercased())
                    }
                    NavigationLink(destination: JobList()){
                        TextButton(text:"Customers\njobs".uppercased())
                        
                    }
                }
            }
        }
    }
}

struct TextButton: View{
    var text: String
    var body: some View{
        Text(text)
            .foregroundColor(Color("TextColor"))
                .bold()
                .font(.title3)
        .padding(15.0)
        .background(
            ZStack{
                Color("ButtonColor")
            })
        .foregroundColor(Color.black)
        .cornerRadius(21.0)
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
