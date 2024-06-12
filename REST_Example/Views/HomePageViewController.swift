//
//  ViewController.swift
//  REST_Example
//
//  Created by E5000855 on 11/06/24.
//

import UIKit

class HomePageViewController: UIViewController {

    // Declaring Buttons
    let getbtn = UIButton()
    let postBtn = UIButton()
    let putBtn = UIButton()
    let deleteBtn = UIButton()
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        view.backgroundColor = .black

        setupButtons()
        setupLayout()
        
        
        getbtn.addTarget(self, action:#selector(performGET), for: .touchUpInside)
        postBtn.addTarget(self, action:#selector(performPOST), for: .touchUpInside)
        putBtn.addTarget(self, action:#selector(performPUT), for: .touchUpInside)
        deleteBtn.addTarget(self, action:#selector(performDELETE), for: .touchUpInside)
       
        
    }
    @objc func performGET() {
           print("performing GET")
           APIManager.shared.getAllProducts { [weak self] result in
               switch result {
               case .success(let products):
                   DispatchQueue.main.async {
                       let vc = AllDataViewController()
                       vc.data = products
                       self?.navigationController?.pushViewController(vc, animated: true)
                   }
               case .failure(let error):
                   DispatchQueue.main.async {
                       self?.handleError(error)
                   }
               }
           }
       }
    
    func handleError(_ error: APIManager.APIError) {
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    
    @objc func performPOST() {
        print("performing POST")
        PostDataViewModel.shared.post()
        let vc = PostDataViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    
    @objc func performPUT(){
        print("performing PUT")
        PutDataVIewModel.shared.put()
        let vc = PutViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func performDELETE(){
        print("performing DELETE")
        DeleteDataViewModel.shared.delete()
        let vc = DeleteViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupButtons(){
        getbtn.setTitle("GET ALL PRODUCTS", for: .normal)
        postBtn.setTitle("POST A NEW PRODUCT", for: .normal)
        putBtn.setTitle("UPDATE AN EXISTING PRODUCT", for: .normal)
        deleteBtn.setTitle("DELETE A PRODUCT", for: .normal)
        
        
        getbtn.backgroundColor = .blue
        postBtn.backgroundColor = .systemMint
        putBtn.backgroundColor = .green
        deleteBtn.backgroundColor = .red
        
        putBtn.setTitleColor(.black, for: .normal)
        
        view.addSubview(getbtn)
        view.addSubview(postBtn)
        view.addSubview(putBtn)
        view.addSubview(deleteBtn)
        
        getbtn.translatesAutoresizingMaskIntoConstraints = false
        postBtn.translatesAutoresizingMaskIntoConstraints = false
        putBtn.translatesAutoresizingMaskIntoConstraints = false
        deleteBtn.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupLayout(){
        
        NSLayoutConstraint.activate([
            getbtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            getbtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            getbtn.widthAnchor.constraint(equalToConstant: 200),
            getbtn.heightAnchor.constraint(equalToConstant: 60),
            
            postBtn.topAnchor.constraint(equalTo: getbtn.bottomAnchor, constant: 40),
            postBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            postBtn.widthAnchor.constraint(equalToConstant: 200),
            postBtn.heightAnchor.constraint(equalToConstant: 60),
            
            putBtn.topAnchor.constraint(equalTo: postBtn.bottomAnchor, constant: 40),
            putBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            putBtn.widthAnchor.constraint(equalToConstant: 300),
            putBtn.heightAnchor.constraint(equalToConstant: 60),

            deleteBtn.topAnchor.constraint(equalTo: putBtn.bottomAnchor, constant: 40),
            deleteBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            deleteBtn.widthAnchor.constraint(equalToConstant: 200),
            deleteBtn.heightAnchor.constraint(equalToConstant: 60),

            
        ])

     
    }
    
  

}

