//
//  InputPickerView.swift
//  AdProject
//
//  Created by Jimmy on 2019/6/28.
//  Copyright © 2019 . All rights reserved.
//

import UIKit

// If you use custom model,your custom model has to follow protocol "InputPickerData"
public protocol InputPickerData {
    func showedStr() -> String
}

extension String:InputPickerData {
    public func showedStr() -> String {
        return self
    }
}

public class InputPickerView<T:InputPickerData>: UIView,UIPickerViewDataSource,UIPickerViewDelegate {
    var pickerView = UIPickerView()
    public typealias didSelectRow = (_ row:Int,_ str:String, _ model:T) -> ()
    var didSelectAction :didSelectRow?
    public var dataSource:[T] = []

    public var row:Int {
        get {
            return pickerView.selectedRow(inComponent: 0)
        }
        set {
            pickerView.selectRow(row, inComponent: 0, animated: true)
        }
    }

    public var selectStr:String {
        get {
            guard dataSource.count > row else {
                return ""
            }

            return dataSource[row].showedStr()
        }
    }

    public var selectModel:T? {
        get {
            guard dataSource.count > row else {
                return nil
            }

            return dataSource[row]
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    //common func to init our view
    private func setupView() {
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.frame = CGRect(x: 0, y: 0, width: pickerView.bounds.width, height: pickerView.bounds.height)
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(pickerView)
    }

    //dataSource : some models/ strings that you want to show by pickerView
    //didSelectAction: some action that you want to do after pickerView didSelectRow
    public func setupData(_ dataSource:[T], didSelectAction:@escaping didSelectRow) {
        self.dataSource = dataSource
        self.didSelectAction = didSelectAction
        pickerView.reloadComponent(0)
    }

    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }

    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row].showedStr()
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard dataSource.count > row else {return}
        let model = dataSource[row]
        let str = model.showedStr()
        if let didSelectAction = didSelectAction {
            didSelectAction(row,str,model)
        }
    }
}

