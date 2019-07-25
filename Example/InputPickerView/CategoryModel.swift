//
//  CategoryModel.swift
//  InputPickerView
//
//  Created by Jimmy on 2019/6/13.
//  Copyright © 2019 Jimmy. All rights reserved.
//

import UIKit
import InputPickerView

class CategoryModel: Codable,InputPickerData {
    func showedStr() -> String {
        return category
    }
    
    var category:String
    var categoryKey:String
    
    init(category: String, categoryKey: String) {
        self.category = category
        self.categoryKey = categoryKey
    }
}

