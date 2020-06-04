Pod::Spec.new do |s|

  s.name                = "Emojica"
  s.version             = "0.9.6"
  s.summary             = "A Swift framework for custom emoji conversion."

  s.homepage            = "https://github.com/xoudini/emojica"
  s.screenshots         = "https://raw.githubusercontent.com/xoudini/emojica/images/demo.gif"

  s.license             = { :type => "Apache License, Version 2.0", :file => "LICENSE" }
  s.author              = { "Dan Lindholm" => "main@xoudini.com" }
  s.social_media_url    = "http://twitter.com/xoudini"
  s.platform            = :ios, "10.1"

  s.source              = { :git => "https://github.com/xoudini/emojica.git", :tag => s.version.to_s }
  s.source_files        = "Source/*.{h,swift}"
  s.swift_version       = "5.0"

end
