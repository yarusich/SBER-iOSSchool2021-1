//
//  SecondViewController.swift
//  L10-UIKit
//
//  Created by Антон Сафронов on 21.05.2021.
//

import UIKit

final class SecondViewController: UIViewController {
    
    lazy var textLabel: UILabel = {
        let text = UILabel(frame: .init(x: .zero, y: .zero, width: 300, height: 300))
//        text.backgroundColor = .red
        text.textAlignment = .center
        text.text = "🍩"
        text.font = .systemFont(ofSize: 210)
        return text
    }()
    
    override func viewDidLoad() {
        
        view.backgroundColor = .purple
        view.addSubview(textLabel)
    }
     
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        textLabel.center = view.center
    }
    
}
