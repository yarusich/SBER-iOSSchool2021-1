//
//  SettingsViewController.swift
//  L19-CameraFilters
//
//  Created by Антон Сафронов on 21.06.2021.
//



import UIKit

final class SettingsViewController: UIViewController {
    
    private var filterService = FilterService()
    
    private var selectedFilter: String?
    
    private var selectedIntensity: CGFloat
    
    private var imageFromToBeView: UIImage
    
    weak var delegate: ToBeViewControllerDelegate?
    
    private lazy var previewImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .none
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var slider: UISlider = {
        let slider = UISlider()
        
        slider.value = Float(selectedIntensity)
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
        label.font = label.font.withSize(18)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Сохранить", for: .normal)
        button.layer.cornerRadius = 25
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var applyButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Применить", for: .normal)
        button.layer.cornerRadius = 25
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(applyButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Отмена", for: .normal)
        button.layer.cornerRadius = 25
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    init(imageFromToBeView: UIImage, selectedFilter: String?, selectedIntensity: CGFloat) {
        self.imageFromToBeView = imageFromToBeView
        self.selectedFilter = selectedFilter
        self.selectedIntensity = selectedIntensity
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Настройки"
        view.backgroundColor = .gray
        
        view.addSubview(previewImage)
        view.addSubview(sliderLabel)
        view.addSubview(slider)
        view.addSubview(saveButton)
        view.addSubview(applyButton)
        view.addSubview(cancelButton)
        
        previewImage.isHidden = true
        applyButton.isEnabled = false
        saveButton.isEnabled = false
        
        setConstraintes()
    }
    
    private func setConstraintes() {
        NSLayoutConstraint.activate([
            
            previewImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            previewImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            previewImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            previewImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
            
            applyButton.widthAnchor.constraint(equalToConstant: 100),
            applyButton.heightAnchor.constraint(equalToConstant: 50),
            applyButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            applyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            cancelButton.widthAnchor.constraint(equalToConstant: 100),
            cancelButton.heightAnchor.constraint(equalToConstant: 50),
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            saveButton.widthAnchor.constraint(equalToConstant: 100),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        
            sliderLabel.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: -10),
            sliderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sliderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sliderLabel.heightAnchor.constraint(equalToConstant: 40),
            
            slider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    @objc private func applyButtonTapped() {
        navigationController?.popViewController(animated: true)
        delegate?.updateCurrentIntensity(intensity: selectedIntensity)
    }
    
    @objc private func saveButtonTapped() {
        navigationController?.popViewController(animated: true)
        delegate?.saveImage()
        
    }
    
    @objc private func cancelButtonTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func sliderFunc(_ value: CGFloat) {
        
        selectedIntensity = CGFloat(slider.value)
        if let filter = selectedFilter {
            previewImage.isHidden = false
            previewImage.image = filterService.doFilter(imageFromToBeView, filterName: filter, intensity: selectedIntensity)
            applyButton.isEnabled = true
            saveButton.isEnabled = true
        } else {
            sliderLabel.text = "Выберите фильтр на прошлом экране"
            return
        }
    }
}

