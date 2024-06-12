//
//  PostDataViewController.swift
//  REST_Example
//
//  Created by E5000855 on 12/06/24.
//

import UIKit

class PostDataViewController: UIViewController {

    var textView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = PostDataViewModel.shared.data as? String 
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = .white
        textView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    

    

}
