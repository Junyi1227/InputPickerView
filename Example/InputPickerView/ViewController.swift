//
//  ViewController.swift
//  InputPickerView
//
//  Created by KartChang on 2019/7/25.
//  Copyright © 2019 Jimmy. All rights reserved.
//

import UIKit
import InputPickerView

class ViewController: UIViewController {

    @IBOutlet weak var myField: UITextField!
    @IBOutlet weak var strField: UITextField!
    let dataSource = [CategoryModel(category: "電影", categoryKey: "movie"),
                      CategoryModel(category: "運動", categoryKey: "sport"),
                      CategoryModel(category: "爬山", categoryKey: "hiking"),
                      CategoryModel(category: "書籍", categoryKey: "book")]
    
    lazy var pickerView = InputPickerView<CategoryModel>()
    lazy var strPickerView = InputPickerView<String>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerView.setupData(dataSource) { (row, selectStr, selectModel) in
            //do something.
            self.myField.text = selectStr
            print(selectModel)
        }
        myField.inputView = pickerView

        strPickerView.setupData(["1","2","3","4"]) { (row, selectStr,string) in
            self.strField.text = selectStr
        }
        strField.inputView = strPickerView
        
        //you can do
//        print(pickerView.dataSource)
//        print(pickerView.row)
//        if let model  = pickerView.selectModel {
//         print(model)
//        }
//        print(pickerView.selectStr)

    }


}

