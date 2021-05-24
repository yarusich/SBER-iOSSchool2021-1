//
//  ShareActivity.swift
//  L11-UIViewController
//
//  Created by Антон Сафронов on 24.05.2021.
//

import UIKit

class ShareActivity: UIActivity {
    var title: String
    var image: UIImage?
    var action: ([Any]) -> Void
    var items: [Any] = [Any]()
    
    init(title: String, image: UIImage?, action: @escaping (([Any]) -> Void)) {
        self.title = title
        self.image = image
        self.action = action
        super.init()
    }
        override var activityTitle: String? {
        title
    }
    
        override var activityImage: UIImage? {
        image
    }
    
        override var activityType: UIActivity.ActivityType? {
            .none
    }
    
        override class var activityCategory: UIActivity.Category {
        .share
    }
    
        override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        true
    }
    
    override var activityViewController: UIViewController? {
        let alert = UIAlertController(title: "Ура!", message: "Всё работает", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default) {
            [unowned self] action in
            alert.dismiss(animated: true)
            self.activityDidFinish(true)
        })
        return alert
    }

}
