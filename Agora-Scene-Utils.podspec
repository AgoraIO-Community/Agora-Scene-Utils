Pod::Spec.new do |spec|
   spec.name          = "Agora-Scene-Utils"
   spec.version       = "1.0.9"
   spec.summary       = "Agora Scene Utils. UI Classes for use in usecase demos."
   spec.description   = "Agora Scene Utils. UI Classes for use in usecase demos."
   spec.homepage      = "git@github.com:AgoraIO-Community/Agora-Scene-Utils"
   spec.license       = { "type" => "Copyright", "text" => "Copyright 2018 agora.io. All rights reserved.\n"}
   spec.author        = { "Agora Lab" => "developer@agora.io" }
   spec.platform      = :ios
   spec.source        = { :git => "https://github.com/AgoraIO-Community/Agora-Scene-Utils.git", :tag=> "#{spec.version}" }
   spec.source_files = "AgoraUIKit/Classes/AgoraUIKit/**/*.swift"
   spec.requires_arc  = true
   spec.ios.deployment_target = '13.0'
   spec.swift_version = '5.0'
   
 end