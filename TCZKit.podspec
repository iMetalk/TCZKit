Pod::Spec.new do |s|

  s.name         = "TCZKit"
  s.version      = "0.0.1"
  s.summary      = "TCZKit is a ui library that make ui easy"
  s.homepage     = "https://github.com/iMetalk/TCZKit"
  s.license      = "MIT"
  s.author       = {
                    "wangsuyan" => "iMetalk@163.com",
                    "xuehaoxia" => "iMetalk@163.com",
                    "wuzuo" => "iMetalk@163.com",
                    "tianxiangyang" => "iMetalk@163.com"
 }
  s.source       = { :git => "https://github.com/iMetalk/TCZKit", :commit => "3e9f341e1f22ef94d411c4c431cc011d0284e9df", :tag => s.version.to_s}
  s.source_files  = "TCZKitDemo/*.{h,m}"
  s.requires_arc  = true

  # s.private_header_files = "YTKNetwork/YTKNetworkPrivate.h"

  s.ios.deployment_target = "8.0"
  # s.osx.deployment_target = "10.9"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"
  # s.framework = "CFNetwork"

  s.dependency "AFNetworking", "~> 3.0"
end
