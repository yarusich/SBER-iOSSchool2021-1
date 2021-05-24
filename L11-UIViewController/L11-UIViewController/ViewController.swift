//
//  ViewController.swift
//  L11-UIViewController
//
//  Created by Антон Сафронов on 24.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var textField: UITextField = {
        let textF = UITextField()
        textF.borderStyle = .roundedRect
        textF.textAlignment = .center
        textF.placeholder = "Текст"
        return textF
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Share", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(share), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        view.addSubview(textField)
        view.addSubview(shareButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        setTextFieldConstraints()
        setButtonConstraints()
    }
    
    func setTextFieldConstraints() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        textField.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height/2).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setButtonConstraints() {
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        shareButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        shareButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    @objc func share() {
        if textField.text?.count == 0 {
            textField.placeholder = "Напечатайте что-нибудь"
            return
        }
        
        let items: [String] = ["Text fot Share"]
        
        let myActivity = ShareActivity(title: "myActivity", image: nil) { items in
            print(items)
        }
        
        let ac = UIActivityViewController(activityItems: items, applicationActivities: [myActivity])
        
        ac.excludedActivityTypes = [.postToFlickr, .postToVimeo, .saveToCameraRoll]
        
        present(ac, animated: true, completion: nil)
    }
}

