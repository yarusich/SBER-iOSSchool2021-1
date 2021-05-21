//
//  ViewController.swift
//  L10-UIKit
//
//  Created by Антон Сафронов on 20.05.2021.
//

import UIKit

class ViewController: UIViewController {

    lazy var bublicView: Bublic = {
        let circle = Bublic(frame: CGRect(x: .zero, y: .zero, width: 300, height: 300))
        circle.backgroundColor = .clear
        return circle
    }()
    
    lazy var buttonSecondVC: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Нажми меня", for: .normal)
        button.addTarget(self, action: #selector(buttonSVC), for: .touchUpInside)
//        button.backgroundColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        view.addSubview(buttonSecondVC)
        view.addSubview(bublicView)
        
    }

    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        bublicView.center = view.center
        
        buttonSecondVC.frame = .init(x: .zero, y: .zero, width: 125, height: 125)
        buttonSecondVC.center = view.center
    }
    
    @objc func buttonSVC() {
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }
    
}

