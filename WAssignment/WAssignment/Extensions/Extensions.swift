//
//  Extensions.swift
//  WAssignment
//
//  Created by Hemant on 19/07/20.
//  Copyright © 2020 Hemant. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(imageHref: String?) {
        self.image = UIImage(named: "wipro-placeholder")
        ImageViewServiceManager().loadImage(imageHref: imageHref) {[unowned self] (image) in
            guard let loadedImage = image else {
                return
            }
            self.image = loadedImage
        }
    }
}
