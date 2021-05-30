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

    lazy var labelTree: UILabel = {
        let text = UILabel()
        text.text = "🌲"
        text.textAlignment = .center
//        text.font = .systemFont(ofSize: 340)
        text.font = .systemFont(ofSize: 10)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
//    lazy var labelTree: CATextLayer = {
//        let text = CATextLayer()
//        text.string = "🌲"
//        text.font = UIFont.systemFont(ofSize: 10)
////        text.font = .systemFont(ofSize: 340)
//        text.backgroundColor = UIColor.clear.cgColor
////        text.contentsScale = view.main
//        text.frame = view.bounds
//        return text
//    }()
    
    lazy var labelApple1: UILabel = {
        let text = UILabel()
        text.text = "🍎"
        text.textAlignment = .center
        text.font = .systemFont(ofSize: 35)
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    lazy var labelApple2: UILabel = {
        let text = UILabel()
        text.text = "🍎"
        text.textAlignment = .center
        text.font = .systemFont(ofSize: 35)
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    lazy var labelApple3: UILabel = {
        let text = UILabel()
        text.text = "🍎"
        text.textAlignment = .center
        text.font = .systemFont(ofSize: 35)
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    lazy var labelApple4: UILabel = {
        let text = UILabel()
        text.text = "🍎"
        text.textAlignment = .center
        text.font = .systemFont(ofSize: 35)
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    lazy var labelApple5: UILabel = {
        let text = UILabel()
        text.text = "🍎"
        text.textAlignment = .center
        text.font = .systemFont(ofSize: 35)
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    lazy var labelApple6: UILabel = {
        let text = UILabel()
        text.text = "🍎"
        text.textAlignment = .center
        text.font = .systemFont(ofSize: 35)
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        view.addSubview(startBtm)
//        view.addSubview(labelTree)
        view.addSubview(labelApple1)
//        view.addSubview(labelApple2)
//        view.addSubview(labelApple3)
//        view.addSubview(labelApple4)
//        view.addSubview(labelApple5)
//        view.addSubview(labelApple6)
        
        setConstraite()
        labelTree.isHidden = true
        labelApple1.isHidden = true
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
//        view.layer.addSublayer(labelTree)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        labelTree.frame = .init(x: .zero, y: .zero, width: view.bounds.width, height: 375)
//        print(view.bounds.width)

//        labelTree.center = view.center
        
//        labelTree.frame = .init(x: view.center.x - 10, y: view.center.y + 250, width: 300, height: 300)
        
        labelApple1.frame = .init(x: 155, y: 370, width: 40, height: 40)
        labelApple2.frame = .init(x: 215, y: 430, width: 40, height: 40)
        labelApple3.frame = .init(x: 120, y: 450, width: 40, height: 40)
        labelApple4.frame = .init(x: 90, y: 530, width: 40, height: 40)
        labelApple5.frame = .init(x: 180, y: 500, width: 40, height: 40)
        labelApple6.frame = .init(x: 260, y: 560, width: 40, height: 40)
        
        
        
        
        
    }

    func setConstraite() {
        NSLayoutConstraint.activate([
            startBtm.heightAnchor.constraint(equalToConstant: 50),
            startBtm.widthAnchor.constraint(equalToConstant: 100),
            startBtm.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startBtm.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),

            
//            labelTree.heightAnchor.constraint(equalToConstant: 50),
//            labelTree.widthAnchor.constraint(equalToConstant: 50),
            labelTree.heightAnchor.constraint(equalToConstant: view.frame.width),
            labelTree.widthAnchor.constraint(equalToConstant: view.frame.width),
            labelTree.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            labelTree.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
    }
    
    @objc func startAnimation() {
        
        UIView.animate(withDuration: 1,
                       delay: 0.0,
                       options: .curveEaseOut,
                       animations: {
                        self.startBtm.alpha = 0.0
                       })
//        1.5
        Timer.scheduledTimer(timeInterval: TimeInterval(), target: self, selector: #selector(treeAnimation), userInfo: nil, repeats: false)
    }


    
    @objc func treeAnimation() {
        labelTree.isHidden = false
        
        let fontSizeAnimation = CABasicAnimation(keyPath: "fontSize")
        fontSizeAnimation.fromValue = 10
        fontSizeAnimation.toValue = 300
        fontSizeAnimation.duration = 3
        labelTree.layer.add(fontSizeAnimation, forKey: nil)
        
//        var fontSize = labelTree.
        
//        UIView.animateKeyframes(withDuration: 5, delay: 0, options: .calculationModeLinear) {
//
//            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 4.0) {
//
//                self.labelTree.font = .systemFont(ofSize: 50.0)
//        }
//        } completion: { _ in
////            self.labelTree.isHidden = true
//        }
//        UIView.animate(withDuration: 2, delay: 0, animations: { [weak self] in
//            self?.labelTree.font = .systemFont(ofSize: 50)
//            self?.labelTree.font = .systemFont(ofSize: 50)
//        }, completion: { _ in
//            self.labelTree.font = .systemFont(ofSize: 300)
//        }
//        )

        

        //        startBtm.isHidden = true
        
    }
}


