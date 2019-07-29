Pod::Spec.new do |s|
  s.name             = 'InputPickerView'
  s.version          = '0.1.1'
  s.summary          = 'A simple pickerView for inputView,and support [Custom Model] / [String]'
  s.homepage         = 'https://github.com/Junyi1227/InputPickerView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Junyi1227' => 'trance1227@gmail.com' }
  s.source           = { :git => 'https://github.com/Junyi1227/InputPickerView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'InputPickerView/Classes/**/*'
    s.swift_version = '5'
end
