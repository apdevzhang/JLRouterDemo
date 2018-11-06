Pod::Spec.new do |s|
  s.name         = "CocoaRouter"
  s.version      = "0.0.1"
  s.summary      = "Router kit based on JLRoutes"
  s.homepage     = "https://github.com/skooal/RouterManager.git"
  s.license      = "MIT"
  s.author       = { "BANYAN" => "greenbanyan@163.com" }
  s.platform     = :ios,'8.0'
  s.source       = { :git => "https://github.com/skooal/RouterManager.git", :tag => s.version }
  s.source_files = "RouterManager/*.{h,m}"
  s.dependency 'JLRoutes', '>= 2.1'
  s.requires_arc = true
end
