//
//  WebRequestManager.swift
//  WAssignment
//
//  Created by Hemant on 19/07/20.
//  Copyright © 2020 Hemant. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, UIImage>()

enum NetworkError: Error {
    case inValidURL
    case internetError
    case inValidResponse
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .inValidURL:
            return NSLocalizedString("Invalid url", comment: "Request url is not valid.")
        case .internetError:
            return NSLocalizedString("No network", comment: "Please check your internet connection")
        case .inValidResponse:
            return NSLocalizedString("No Data", comment: "Response data is not valid")
        }
    }
}

enum HttpMethod: String {
    case  get
}

class WebRequestManager {
    func request(urlString: String, method: HttpMethod, result: @escaping(Data?, URLResponse?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            result(nil, nil, NetworkError.inValidURL)
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            result(data, urlResponse, error)
        }.resume()
    }
}


extension UIImageView {
    func loadImage(imageHref: String?) {
        self.image = UIImage(named: "wipro-placeholder")
        guard let urlSting = imageHref,
            let url = URL(string: urlSting)
            else { return }

        if let cachedImage = imageCache.object(forKey: urlSting as AnyObject) {
            image = cachedImage
            return
        }
        
        URLSession.shared.dataTask(with: url) {[unowned self] (data, urlResponse, error) in
            DispatchQueue.main.async {
                guard let imageData = data,
                    let loadedImage = UIImage(data: imageData)
                    else {
                        return
                }
                imageCache.setObject(loadedImage, forKey: urlSting as AnyObject)
                self.image = loadedImage
            }
        }.resume()
    }
}
