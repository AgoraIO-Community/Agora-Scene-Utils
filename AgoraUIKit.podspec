Pod::Spec.new do |spec|
   spec.name          = "AgoraUIKit"
   spec.version       = "1.0.0"
   spec.summary       = "Agora iOS UIKit"
   spec.description   = "iOS UIKit"
   spec.homepage      = "git@github.com:AgoraIO-Community/UIKit-iOS"
   spec.license       = { "type" => "Copyright", "text" => "Copyright 2018 agora.io. All rights reserved.\n"}
   spec.author        = { "Agora Lab" => "developer@agora.io" }
   spec.platform      = :ios
   spec.source        = { :git => "git@github.com:AgoraIO-Community/UIKit-iOS.git", :tag=> "#{spec.version}" }
   spec.source_files = "AgoraUIKit/Classes/AgoraUIKit/**/*.swift"
   spec.requires_arc  = true
   spec.ios.deployment_target = '13.0'
   
 end