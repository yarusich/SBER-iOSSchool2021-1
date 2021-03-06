//
//  SpinnerViewController.swift
//  L17-NSURLSession
//
//  Created by Антон Сафронов on 06.06.2021.
//

import UIKit

class SpinnerViewController: UIViewController {
    private let spinner = UIActivityIndicatorView(style: .large)

    override func loadView() {
        view = UIView()


        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    func startAnimation() {
        spinner.startAnimating()
    }
    
    func stopAnimation() {
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
        }
    }
    
}
