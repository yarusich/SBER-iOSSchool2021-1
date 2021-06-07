//
//  GetPhotoResponse.swift
//  L17-NSURLSession
//
//  Created by Антон Сафронов on 06.06.2021.
//
import Foundation



struct GetPhotosResponse: Decodable {
    let photos: [GetPhotoDataResponse]
}
struct GetPhotoDataResponse: Decodable {
    let id: Int
    let width: Int
    let height: Int
    let photographer: String
    let url: String
}
