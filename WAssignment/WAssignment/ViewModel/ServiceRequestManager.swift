//
//  ServiceRequestManager.swift
//  WAssignment
//
//  Created by Hemant on 19/07/20.
//  Copyright © 2020 Hemant. All rights reserved.
//

import Foundation
import UIKit

class FactServiceRequestManager {
    func fetchData(result: @escaping (FactDataModel?, Error?) -> Void) {
        let urlString = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        WebRequestManager().request(urlString: urlString, method: .get) {(data, urlResponse, error) in
            guard error == nil else {
                result(nil, error)
                return
            }
            if let responseData = data {
                if let responseString = String(data: responseData, encoding: .isoLatin1),
                    let encodedData = responseString.data(using: String.Encoding.utf8){
                    do {
                        let factDataModel = try JSONDecoder().decode(FactDataModel.self, from: encodedData)
                        result(factDataModel, nil)
                    } catch let jsonError {
                        result(nil, jsonError)
                    }
                    return
                }
            }
            result(nil, NetworkError.inValidResponse)
        }
    }
}

let imageCache = NSCache<AnyObject, UIImage>()

class ImageViewServiceManager {
    func loadImage(imageHref: String?, result: @escaping (UIImage?) -> Void) {
        guard let urlSting = imageHref
            else {
                result(nil)
                return
        }

        if let cachedImage = imageCache.object(forKey: urlSting as AnyObject) {
            result(cachedImage)
            return
        }

        WebRequestManager().request(urlString: urlSting, method: nil) {(data, urlResponse, error) in
            DispatchQueue.main.async {
                guard let imageData = data,
                    let loadedImage = UIImage(data: imageData)
                    else {
                        return
                }
                imageCache.setObject(loadedImage, forKey: urlSting as AnyObject)
                result(loadedImage)
            }
        }
    }
}
