//
//  PhotoCell.swift
//  L17-NSURLSession
//
//  Created by Антон Сафронов on 06.06.2021.
//

import UIKit

final class PhotoCell: UITableViewCell {

    static let indentifirer = "PhotoCell"

    func configure(with model: GetPhotoDataResponse) {
        textLabel?.text = model.photographer
    }
}
