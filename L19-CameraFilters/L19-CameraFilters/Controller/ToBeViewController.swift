//
//  ToBeViewController.swift
//  L19-CameraFilters
//
//  Created by Антон Сафронов on 21.06.2021.
//

import UIKit

final class ToBeViewController: UIViewController {
    
    weak var delegate: AsIsViewController?
    let filters = Filters()
    let imagesWithFilters = ImagesWithFilters()


    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        setConstraintes()
//        configurateNavBar()
        view.backgroundColor = .red
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    

    

}

