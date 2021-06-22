//
//  SettingsViewController.swift
//  L19-CameraFilters
//
//  Created by Антон Сафронов on 21.06.2021.
//



import UIKit

final class SettingsViewController: UIViewController {
    
    var selectedIntensity = CGFloat()
    
    private lazy var slider: UISlider = {
        let slider = UISlider()
        
        slider.value = 0.5
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.addTarget(self, action: #selector(sliderFunc(_:)), for: .valueChanged)
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
        let button = UIButton(type: .system)
        
        button.setTitle("Сохранить", for: .normal)
        button.layer.cornerRadius = 25
        button.backgroundColor = .red
//        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var applyButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Применить", for: .normal)
        button.layer.cornerRadius = 25
        button.backgroundColor = .red
//        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(applyButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Отмена", for: .normal)
        button.layer.cornerRadius = 25
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .orange
        view.addSubview(sliderLabel)
        view.addSubview(slider)
        view.addSubview(saveButton)
        view.addSubview(applyButton)
        view.addSubview(cancelButton)
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
            
//            saveButton.widthAnchor.constraint(equalToConstant: 100),
//            saveButton.heightAnchor.constraint(equalToConstant: 50),
//            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            
            applyButton.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 100),
            applyButton.widthAnchor.constraint(equalToConstant: 100),
            applyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            applyButton.heightAnchor.constraint(equalToConstant: 50),
            
            cancelButton.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 100),
            cancelButton.widthAnchor.constraint(equalToConstant: 100),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            cancelButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
    
    
    @objc private func applyButtonTapped() {
        navigationController?.popViewController(animated: true)
        selectedIntensity = CGFloat(slider.value)
    }
    
    @objc private func saveButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func cancelButtonTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func sliderFunc(_ value: CGFloat) {
        selectedIntensity = value
    }

    
}

