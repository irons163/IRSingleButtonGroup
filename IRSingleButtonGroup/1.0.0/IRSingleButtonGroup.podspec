Pod::Spec.new do |spec|
  spec.name         = "IRSingleButtonGroup"
  spec.version      = "1.0.0"
  spec.summary      = "Make a Button Group to control."
  spec.description  = "Make a Button Group to control."
  spec.homepage     = "https://github.com/irons163/IRSingleButtonGroup.git"
  spec.license      = "MIT"
  spec.author       = "irons163"
  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/irons163/IRSingleButtonGroup.git", :tag => spec.version.to_s }
# spec.source       = { :path => '.' }
  spec.source_files  = "IRSingleButtonGroup/Class"
end