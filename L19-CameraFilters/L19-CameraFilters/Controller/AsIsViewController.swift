//
//  AsIsViewController.swift
//  L19-CameraFilters
//
//  Created by Антон Сафронов on 21.06.2021.
//



import UIKit



final class AsIsViewController: UIViewController {
    
    
    private lazy var slider: UISlider = {
        let slider = UISlider()
        
        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 1
//        slider.addTarget(self, action: #selector(didEndChanged(_:)), for: .editingDidEnd)
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        return slider
    }()
    
    private lazy var sliderLabel: UILabel = {
        let label = UILabel()
        label.text = "Интенсивность фильтра"
        label.textAlignment = .center
//        label.font = label.font.withSize(15)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Сохранить", for: .normal)
        button.backgroundColor = .red
//        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .orange
        view.addSubview(sliderLabel)
        view.addSubview(slider)
        view.addSubview(saveButton)
        setConstraintes()
    }
    
    private func setConstraintes() {
        NSLayoutConstraint.activate([
        
            sliderLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            sliderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            sliderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            sliderLabel.heightAnchor.constraint(equalToConstant: 40),
            
            slider.topAnchor.constraint(equalTo: sliderLabel.bottomAnchor, constant: 100),
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            saveButton.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 100),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
    
    
    @objc private func buttonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    
    
    
    
    
}
