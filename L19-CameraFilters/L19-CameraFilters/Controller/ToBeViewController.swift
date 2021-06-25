//
//  ToBeViewController.swift
//  L19-CameraFilters
//
//  Created by Антон Сафронов on 21.06.2021.
//

import UIKit

protocol ToBeViewControllerDelegate: class {
    func updateCurrentIntensity(intensity: CGFloat)
    func saveImage()
}

final class ToBeViewController: UIViewController {

    private let filters = Filters()
    private var filterService = FilterService()
    private var currentImage = UIImage()
    private var imagesWithFilters = ImagesWithFilters()
    private var currentIntensity: CGFloat = 0.5
    private var selectedFilter: String?
    
    private lazy var imageLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.numberOfLines = 2
        label.text = "Тапните для выбора изображения"
        label.font = label.font.withSize(25)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .none
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFit
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
        
    private lazy var settingsButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        button.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    private lazy var imagePicker: UIImagePickerController = {
        let imgPicker = UIImagePickerController()
        
        imgPicker.delegate = self
        imgPicker.allowsEditing = true
        imgPicker.sourceType = .photoLibrary
        
        return imgPicker
    }()
    
    
    private lazy var filtersCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 150, height: 150)
        flowLayout.minimumLineSpacing = 10
        
        let filtersCollection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        filtersCollection.backgroundColor = .clear
        filtersCollection.register(FiltersCollectionViewCell.self, forCellWithReuseIdentifier: FiltersCollectionViewCell.identifier)
        filtersCollection.delegate = self
        filtersCollection.dataSource = self
        filtersCollection.translatesAutoresizingMaskIntoConstraints = false
        
        return filtersCollection
    }()
//    MARK: TODO
    init(filterService: FilterService) {
        self.filterService = filterService
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
 
        view.backgroundColor = .white
        
        view.addSubview(imageLabel)
        view.addSubview(imageView)
        view.addSubview(filtersCollectionView)
        
        let settings = UIBarButtonItem(customView: settingsButton)
        navigationItem.setRightBarButtonItems([settings], animated: true)

        setConstraintes()
    }
    
    override func viewWillLayoutSubviews() {
//        if imageView.image == nil {
//            filtersCollectionView.isHidden = true
//        } else {
//            filtersCollectionView.isHidden = false
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateImageView()
    }
    
    private func setConstraintes() {
        NSLayoutConstraint.activate([
            
            imageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
        
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -110),
            
            filtersCollectionView.heightAnchor.constraint(equalToConstant: 150),
            filtersCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            filtersCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            filtersCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    private func updateImageView() {
        imageView.image = filterService.doFilter(currentImage, filterName: selectedFilter, intensity: currentIntensity)
    }
    
    private func setFiltersToImagesInCollectionView(currentImage: UIImage) {
        imagesWithFilters.arrImages = filters.arrOfFilters.map({ [self] item in
            filterService.doFilter(currentImage, filterName: item, intensity: currentIntensity)
        })
    }
    
    @objc private func settingsButtonTapped() {
        let settingsViewController = SettingsViewController(imageFromToBeView: currentImage, selectedFilter: selectedFilter, selectedIntensity: currentIntensity)
        settingsViewController.delegate = self
        navigationController?.pushViewController(settingsViewController, animated: true)
    }

    @objc private func saveFunc() {
        guard let image = imageView.image else { return }
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc private func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
            if let error = error {
                print("Ошибка: \(error)")
            }
            else {
                let alert = UIAlertController(title: "Успешно", message: "Ваша картинка была сохранена в галерею", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
            }
        }
    
    @objc private func imageTapped() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        present(imagePicker, animated: true, completion: nil)
    }
    
//    MARK: Protocol's funcs
    
    func saveImage() {
        saveFunc()
    }

    func updateCurrentIntensity(intensity: CGFloat) {
        currentIntensity = intensity
    }

}

extension ToBeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] as? UIImage else { return }
        currentImage = image
        imageView.image = currentImage
        filtersCollectionView.reloadData()
        setFiltersToImagesInCollectionView(currentImage: currentImage)
        currentIntensity = 0.5
    
        dismiss(animated: true, completion: nil)
    }
}

extension ToBeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filters.arrOfFilters.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FiltersCollectionViewCell.identifier, for: indexPath) as? FiltersCollectionViewCell
        else { return UICollectionViewCell() }

        guard imagesWithFilters.arrImages.count > 0  else { return cell }

            cell.setImage(imagesWithFilters.arrImages[indexPath.item])
            cell.setLabel(filters.arrOfFilters[indexPath.item])
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedFilter = filters.arrOfFilters[indexPath.item]
        navigationItem.title = "Фильтр: \(filters.arrOfFilters[indexPath.item])"
        updateImageView()
    }
}

extension ToBeViewController: ToBeViewControllerDelegate { }
