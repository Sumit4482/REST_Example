//
//  DeleteDataViewModel.swift
//  REST_Example
//
//  Created by E5000855 on 13/06/24.
//

import Foundation

class DeleteDataViewModel{
    
    static let shared = DeleteDataViewModel()
    
    func delete(){


        APIManager.shared.deleteProduct(productId: 6)
        
    }
   
}
