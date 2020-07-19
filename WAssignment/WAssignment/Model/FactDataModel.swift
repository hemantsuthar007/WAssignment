//
//  FactDataModel.swift
//  WAssignment
//
//  Created by Hemant on 19/07/20.
//  Copyright © 2020 Hemant. All rights reserved.
//

struct FactDataModel {
    var title = "as"
    var dataList: [RowDataModel] = []
}

struct RowDataModel {
    let title: String?
    let description: String?
    let imageHref: String?
}
