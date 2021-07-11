//
//  ViewController.swift
//  Lesson31
//
//  Created by Антон Сафронов on 05.07.2021.
//

import UIKit
import ObjcModule
import FirstSwiftLib


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        MARK: objc
        let firstObjc = FirstObjcLib()
        let secondObjc = firstObjc.secondString
        
//        MARK: swift
        let firstSwift = FirstSwiftLib()
        firstSwift.printSomethingOne()
        firstSwift.printSomethingFromSecondLib()
    }
    

}

