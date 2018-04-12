Pod::Spec.new do |s|

  s.name         = "ATGradientProgressView"
  s.version      = "1.0.0"
  s.summary      = "iOS 渐变色进度条"
  s.homepage     = "https://github.com/xiaolouxinyue/ATGradientProgressView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Jaym" => "ywjiang1124@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/xiaolouxinyue/ATGradientProgressView.git", :tag => s.version }
  s.source_files = "ATGradientProgressView/ATGradientProgressView/*"
  s.requires_arc = true

end
