//
//  FirstSwiftLib.swift
//  FirstSwiftLib
//
//  Created by Антон Сафронов on 11.07.2021.
//

import Foundation
import SecondSwiftLib

open class FirstSwiftLib {
    
    public func printSomethingOne() {
        print("Something One")
    }
    
    public func printSomethingFromSecondLib() {
        let secondLib = SecondSwiftLib()
        secondLib.printSomethingTwo()
    }
    
    public init() { }
}
