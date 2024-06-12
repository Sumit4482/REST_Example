//
//  PutDataVIewModel.swift
//  REST_Example
//
//  Created by E5000855 on 13/06/24.
//

import Foundation

class PutDataVIewModel{
    
    static let shared = PutDataVIewModel()
    
    func put(){
        let updatedProduct = ProductP(title: "test product", price: 13.5, description: "lorem ipsum set", image: "https://i.pravatar.cc", category: "electronic")

        APIManager.shared.updateProduct(productId: 1)
        
    }
   
}

