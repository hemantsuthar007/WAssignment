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
    func fetchData(result: @escaping (FactDataModel?, Error?) -> Void) {
        let urlString = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        WebRequestManager().request(urlString: urlString, method: .get) {[unowned self] (data, urlResponse, error) in
            guard error == nil else {
                result(nil, error)
                return
            }
            if let responseData = data {
                if let responseString = String(data: responseData, encoding: .isoLatin1),
                    let encodedData = responseString.data(using: String.Encoding.utf8){
                    do {
                        self.factDataModel = try JSONDecoder().decode(FactDataModel.self, from: encodedData)
                        result(self.factDataModel, nil)
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
