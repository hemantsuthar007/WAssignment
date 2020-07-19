//
//  FactDataModel.swift
//  WAssignment
//
//  Created by Hemant on 19/07/20.
//  Copyright © 2020 Hemant. All rights reserved.
//

struct FactDataModel: Decodable {
    var title = "as"
    var rows: [RowDataModel] = []
}

struct RowDataModel: Decodable {
    let title: String?
    let description: String?
    let imageHref: String?
}
