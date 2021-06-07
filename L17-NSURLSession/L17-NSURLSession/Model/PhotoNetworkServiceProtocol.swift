//
//  PhotoNetworkServiceProtocol.swift
//  L17-NSURLSession
//
//  Created by Антон Сафронов on 06.06.2021.
//

import Foundation

typealias GetPhotosAPIResponse = Result<GetPhotosResponse, NetworkServiceError>

protocol PhotoNetworkServiceProtocol {
    func getData(with completion: @escaping (GetPhotosAPIResponse) -> Void)
    func loadImage(imageUrl: String, completion: @escaping (Data?) -> Void)
}


