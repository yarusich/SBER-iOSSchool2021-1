//
//  FiltersCollectionViewCell.swift
//  L19-CameraFilters
//
//  Created by Антон Сафронов on 21.06.2021.
//

import UIKit

final class FiltersCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CellID"
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private lazy var filterLabel: UILabel = {
        let label = UILabel()

        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.addSubview(filterLabel)
//        self.addSubview(filterLabel)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            filterLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 20),
            filterLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -20),
            filterLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])
    }
    
    public func setImage(_ imageWithFilter: UIImage) {
        imageView.image = imageWithFilter
    }
    
    public func setLabel(_ labelText: String) {
        filterLabel.text = labelText
    }
}
