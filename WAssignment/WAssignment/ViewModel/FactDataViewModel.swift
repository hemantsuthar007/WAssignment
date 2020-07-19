//
//  FactDataViewModel.swift
//  WAssignment
//
//  Created by Hemant on 19/07/20.
//  Copyright © 2020 Hemant. All rights reserved.
//

import Foundation

class FactDataViewModel {
    var factDataModel = FactDataModel()
    
    var title: String {
        return factDataModel.title
    }

    var dataList: [RowDataModel] {
        return factDataModel.dataList
    }
}
