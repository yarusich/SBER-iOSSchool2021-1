//
//  FilterService.swift
//  L19-CameraFilters
//
//  Created by Антон Сафронов on 21.06.2021.
//

import UIKit

class FilterService {
    
    let context = CIContext()

    public func doFilter(_ image: UIImage, filterName: String, intensity: CGFloat) -> UIImage {

            if let filter = CIFilter(name: filterName) {
                let ciImage = CIImage(image: image)
                filter.setValue(ciImage, forKey: kCIInputImageKey)
                filter.setValue(intensity, forKey: kCIInputIntensityKey)
                
                if let filteredImage = filter.outputImage {
                    if let cgImage = context.createCGImage(filteredImage, from: filteredImage.extent) {
                        let finalImage = UIImage(cgImage: cgImage)
                        return finalImage
                    }
                }
            }
            return image
    }
}
