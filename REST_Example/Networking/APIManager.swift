//
//  APIManager.swift
//  REST_Example
//
//  Created by E5000855 on 11/06/24.
//

import Foundation
import UIKit

class APIManager {
    
    static let shared = APIManager()
    let baseURL = URL(string: "https://example.com/api/products")!
    
    enum APIError: Error {
        case invalidURL
        case requestFailed
        case invalidData
        case decodingError
        case encodingError
        case serverError(String)
    }
    
    func getAllProducts(completionHandler: @escaping (Result<[Product], APIError>) -> Void) {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            completionHandler(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completionHandler(.failure(.serverError(error.localizedDescription)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completionHandler(.failure(.requestFailed))
                return
            }
            
            guard (200 ..< 300) ~= httpResponse.statusCode else {
                completionHandler(.failure(.requestFailed))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.invalidData))
                return
            }
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                DispatchQueue.main.async {
                    completionHandler(.success(products))
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler(.failure(.decodingError))
                }
            }
        }.resume()
    }
    
    func postData(){
        let urlOfApi = URL(string: "https://fakestoreapi.com/products")
              if let urlOfApi = urlOfApi {
              let uploadData = ProductP(title: "test Product", price: 13.5, description: "lorem ipsum set", image: "image", category: "eletronics")
              guard let jsonData = try? JSONEncoder().encode(uploadData) else{
                print("Encodeing Error ")
                return
              }
              var request = URLRequest(url: urlOfApi)
              request.httpMethod = "POST"
              request.httpBody = jsonData
              request.setValue("application/json", forHTTPHeaderField: "Content-Type")
              request.setValue("mobile", forHTTPHeaderField: "platform")
              URLSession.shared.dataTask(with: request){
                (data,response,error) in
                guard error == nil else {
                  print("error while posting the data")
                  print(error as Any)
                  return
                }
                if let httpResponse = response as? HTTPURLResponse {
                  if httpResponse.statusCode == 200 {
                    print("Data update successfully")
                    if let data = data {
                      do {
                        let responseData = try JSONSerialization.jsonObject(with: data, options: [])
                        print("Response Data: \(responseData)")
//                        PostDataViewModel.shared.data = responseData
                      } catch {
                        print("Error parsing response data: \(error)")
                      }
                    }
                  } else {
                    print("HTTP Error: \(httpResponse.statusCode)")
                  }
                }
              }.resume()
            }
    }
    
    func updateProduct(productId: Int) {
        let urlOfApi = URL(string: "https://fakestoreapi.com/products/\(productId)")
        if let urlOfApi = urlOfApi {
            let updatedProduct = ProductP(title: "test product", price: 13.5, description: "lorem ipsum set", image: "https://i.pravatar.cc", category: "electronic")
            
            guard let jsonData = try? JSONEncoder().encode(updatedProduct) else {
                print("Not possible to bind data")
                return
            }
            
            var request = URLRequest(url: urlOfApi)
            request.httpMethod = "PUT"
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("mobile", forHTTPHeaderField: "platform")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard error == nil else {
                    print("Error while updating the data")
                    print(error as Any)
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        print("Data updated successfully")
                        if let data = data {
                            do {
                                let responseData = try JSONSerialization.jsonObject(with: data, options: [])
                                print("Response Data: \(responseData)")
                            } catch {
                                print("Error parsing response data: \(error)")
                            }
                        }
                    } else {
                        print("HTTP Error: \(httpResponse.statusCode)")
                    }
                }
            }.resume()
        }
    }

    func deleteProduct(productId: Int) {
        let urlOfApi = URL(string: "https://fakestoreapi.com/products/\(productId)")
        if let urlOfApi = urlOfApi {
            var request = URLRequest(url: urlOfApi)
            request.httpMethod = "DELETE"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("mobile", forHTTPHeaderField: "platform")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard error == nil else {
                    print("Error while deleting the data")
                    print(error as Any)
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        print("Data deleted successfully")
                        if let data = data {
                            do {
                                let responseData = try JSONSerialization.jsonObject(with: data, options: [])
                                print("Response Data: \(responseData)")
                            } catch {
                                print("Error parsing response data: \(error)")
                            }
                        }
                    } else {
                        print("HTTP Error: \(httpResponse.statusCode)")
                    }
                }
            }.resume()
        }
    }
}
