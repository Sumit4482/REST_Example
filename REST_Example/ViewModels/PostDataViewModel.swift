//
//  PostDataViewModel.swift
//  REST_Example
//
//  Created by E5000855 on 12/06/24.
//

import Foundation


class PostDataViewModel{
    static let shared = PostDataViewModel()
    var data:Any = ""
    
    func post(){
       APIManager.shared.postData()
    }
    
}
