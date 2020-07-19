//
//  RowDataViewModel.swift
//  WAssignment
//
//  Created by Hemant on 19/07/20.
//  Copyright © 2020 Hemant. All rights reserved.
//

import Foundation
import UIKit

class RowDataViewModel {
    var rowData: RowDataModel?

    var title: String? {
        return rowData?.title
    }

    var description: String? {
        return rowData?.description
    }

    var imageUrl: String? {
        return rowData?.imageHref
    }
}
