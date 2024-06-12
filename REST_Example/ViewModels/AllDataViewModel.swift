//
//  AllDataViewModel.swift
//  REST_Example
//
//  Created by E5000855 on 11/06/24.
//

import Foundation
var finalProducts = [Product]()
class AllDataViewModel {
    
    static let shared = AllDataViewModel()
        
    func getAllProducts() {
            APIManager.shared.getAllProducts { result in
                switch result {
                case .success(let products):
                    finalProducts = products
//                    print(finalProducts)
                case .failure(let error):
                    print("Failed to fetch products: \(error)")
                }
            }
        
        
        }
    
  
        
    
}
