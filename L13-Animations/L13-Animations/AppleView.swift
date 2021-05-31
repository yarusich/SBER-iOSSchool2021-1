//
//  appleView.swift
//  L13-Animations
//
//  Created by Антон Сафронов on 31.05.2021.
//

import UIKit

final class AppleView: UIImageView {
    
    lazy var viewApple1: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "apple")
        image.contentMode = .scaleAspectFit
        return image
    }()
        
    
}
