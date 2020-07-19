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

    var rows: [RowDataModel] {
        return factDataModel.rows
    }
}

extension FactDataViewModel {
    func fetchData(result: @escaping (Error?) -> Void) {
        FactServiceRequestManager().fetchData {[unowned self] (factDataModel, error) in
            if let fdModel = factDataModel {
                self.factDataModel = fdModel
            }
            result(error)
        }
    }
}
