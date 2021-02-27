Pod::Spec.new do |spec|

  spec.name         = "PDKit"
  spec.version      = "1.0.1"
  spec.summary      = "iOS Development PDKit."
  spec.description  = "iOS Development PDKit made by Professordeng."
  spec.homepage     = "https://github.com/professordeng/PDKit"
  spec.license      = "MIT"
  spec.author       = { "professordeng" => "professordeng@qq.com" }
  spec.platform     = :ios, "14.0"
  spec.source       = { :git => "https://github.com/professordeng/PDKit.git", :tag => "1.0.1" }
  spec.source_files = "PDKit/**/*.swift"
  spec.framework    = "UIKit"
  spec.swift_version = '5.3.3'
  
end
