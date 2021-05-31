//
//  ViewController.swift
//  L13-Animations
//
//  Created by Антон Сафронов on 30.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var degree = CGFloat(Float.pi / 180)
    
    lazy var startBtm: UIButton = {
        let btm = UIButton(type: .system)
        btm.setTitle("Нажми", for: .normal)
        btm.backgroundColor = .red
        btm.layer.cornerRadius = 15
        btm.addTarget(self, action: #selector(startAnimation), for: .touchUpInside)
        btm.translatesAutoresizingMaskIntoConstraints = false
        return btm
    }()
    
    lazy var labelTree: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "tree2")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var viewApple1: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "apple")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var viewApple2: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "apple")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var viewApple3: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "apple")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var viewApple4: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "apple")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var viewApple5: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "apple")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var viewApple6: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "apple")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        view.addSubview(startBtm)
        view.addSubview(labelTree)
        view.addSubview(viewApple1)
        view.addSubview(viewApple2)
        view.addSubview(viewApple3)
        view.addSubview(viewApple4)
        view.addSubview(viewApple5)
        view.addSubview(viewApple6)
        
        
        setConstraite()
        labelTree.isHidden = true
        viewApple1.frame = .init(x: 155, y: 370, width: 0, height: 0)
        viewApple2.frame = .init(x: 215, y: 430, width: 0, height: 0)
        viewApple3.frame = .init(x: 120, y: 450, width: 0, height: 0)
        viewApple4.frame = .init(x: 90, y: 530, width: 0, height: 0)
        viewApple5.frame = .init(x: 180, y: 500, width: 0, height: 0)
        viewApple6.frame = .init(x: 260, y: 540, width: 0, height: 0)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func setConstraite() {
        NSLayoutConstraint.activate([
            startBtm.heightAnchor.constraint(equalToConstant: 50),
            startBtm.widthAnchor.constraint(equalToConstant: 100),
            startBtm.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startBtm.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            
            
            labelTree.heightAnchor.constraint(equalToConstant: 375),
            labelTree.widthAnchor.constraint(equalToConstant: 375),
            labelTree.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelTree.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    
    @objc func startAnimation() {
        
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseOut, animations: {
            self.startBtm.alpha = 0.0
        })
        
        Timer.scheduledTimer(timeInterval: TimeInterval(1.5), target: self, selector: #selector(treeAnimation), userInfo: nil, repeats: false)
    }
    
    
    @objc func treeAnimation() {
        labelTree.isHidden = false
        
        var sizeTree = labelTree.bounds
        sizeTree.size.height = view.frame.height
        sizeTree.size.width = view.frame.width
        
        var sizeApple = viewApple1.bounds
        sizeApple.size.height = 40
        sizeApple.size.width = 40
        
        UIView.animate(
            withDuration: 3,
            delay: 0,
            options: .curveEaseOut) {
            [weak self] in
            guard let self = self else { return }
            self.labelTree.bounds = sizeTree
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(
                withDuration: 3,
                delay: 1,
                options: .curveEaseOut) {
                [weak self] in
                guard let self = self else { return }
                self.viewApple1.bounds = sizeApple
                self.viewApple2.bounds = sizeApple
                self.viewApple3.bounds = sizeApple
                self.viewApple4.bounds = sizeApple
                self.viewApple5.bounds = sizeApple
                self.viewApple6.bounds = sizeApple
            }
        }
    }
}


