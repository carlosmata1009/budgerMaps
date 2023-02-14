//
//  CustomersViewModel.swift
//  BudgerMaps
//
//  Created by Carlos Mata on 2/12/23.
//

import Foundation

final class CustomersViewModel: ObservableObject{
    @Published var customers: [Customer] = []
    @Published var hasError = false
    @Published var error: CustomerError?
    
    func fetchCustomers(){
        
        hasError = false
        
        if let url = URL(string: "https://19h0vwjnce.execute-api.eu-west-3.amazonaws.com/MobileInternshipAPI/data") {
        
            URLSession.shared.dataTask(with: url) { data, response, error in
                    
                    DispatchQueue.main.async {
                        
                        if let error = error {
                            self.hasError = true
                            self.error = CustomerError.custom(error: error)
                        }else{
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                        
                            //Ordenar alfabeticamente por nombre
                             if let data = data,
                               var customers = try? decoder.decode([Customer].self, from: data){
                                customers.sort{
                                    ($0.firstName ?? "null" < $1.firstName ?? "null")
                                }

                                self.customers = customers
                            }else{
                                self.hasError = true
                                self.error = CustomerError.failedToDecode
                            }
                    }
                }
            }.resume()
        }
    }
    func fetchCustomersByJob(){
        
        hasError = false
        
        if let url = URL(string: "https://19h0vwjnce.execute-api.eu-west-3.amazonaws.com/MobileInternshipAPI/data") {
        
            URLSession.shared.dataTask(with: url) { data, response, error in
                    
                    DispatchQueue.main.async {
                        
                        if let error = error {
                            self.hasError = true
                            self.error = CustomerError.custom(error: error)
                        }else{
                            
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "dd/MM/yyyy"
                            
                        
                            //Ordenar alfabeticamente por trabajo
                             if let data = data,
                               var customers = try? decoder.decode([Customer].self, from: data){
                                customers.sort{
                                    ($0.job ?? "null" < $1.job ?? "null")
                                }

                                self.customers = customers
                            }else{
                                self.hasError = true
                                self.error = CustomerError.failedToDecode
                            }
                    }
                }
            }.resume()
        }
    }
    func fetchCustomersByEarlyDate(){
        
        hasError = false
        
        if let url = URL(string: "https://19h0vwjnce.execute-api.eu-west-3.amazonaws.com/MobileInternshipAPI/data") {
        
            URLSession.shared.dataTask(with: url) { data, response, error in
                    
                    DispatchQueue.main.async {
                        
                        if let error = error {
                            self.hasError = true
                            self.error = CustomerError.custom(error: error)
                        }else{
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "dd/MM/yyyy"
                             if let data = data,
                               var customers = try? decoder.decode([Customer].self, from: data){
//                              Trying to sort customers by date, but not working because of null values, still working on it
//                                 customers.sort{
//                                     dateFormatter.date(from: $0.lastCheckIn ?? "null")! > dateFormatter.date(from: $1.lastCheckIn ?? "null")!
//                                 }
                            self.customers = customers
                            }else{
                                self.hasError = true
                                self.error = CustomerError.failedToDecode
                            }
                    }
                }
            }.resume()
        }
    }
}
extension CustomersViewModel{
    enum CustomerError: LocalizedError{
        case custom(error: Error)
        case failedToDecode
        
        var errorDescription: String?{
            switch self{
            case .failedToDecode:
                return "Failed to decode response"
            case .custom(let error):
                return error.localizedDescription
            }
        }
    }
}
