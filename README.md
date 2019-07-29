# InputPickerView

[![CI Status](https://img.shields.io/travis/Junyi1227/InputPickerView.svg?style=flat)](https://travis-ci.org/Junyi1227/InputPickerView)
[![Version](https://img.shields.io/cocoapods/v/InputPickerView.svg?style=flat)](https://cocoapods.org/pods/InputPickerView)
[![License](https://img.shields.io/cocoapods/l/InputPickerView.svg?style=flat)](https://cocoapods.org/pods/InputPickerView)
[![Platform](https://img.shields.io/cocoapods/p/InputPickerView.svg?style=flat)](https://cocoapods.org/pods/InputPickerView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

In your custom model
"showedStr" is reture your pickerView's showed string.

```swift
import InputPickerView

class CategoryModel: Codable,InputPickerData {
    func showedStr() -> String {
        return category
    }

    var category:String
    var categoryKey:String
}

```

use InputPickerView
```
lazy var pickerView = InputPickerView<CategoryModel>()

pickerView.setupData(dataSource) { (row, selectStr, selectModel) in

}
myField.inputView = pickerView

```

## Installation

InputPickerView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'InputPickerView'
```

## Author

Junyi1227, trance1227@gmail.com

## License

InputPickerView is available under the MIT license. See the LICENSE file for more info.
