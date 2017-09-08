Pod::Spec.new do |s|

  s.name         = 'KangcPack'
  s.version      = '0.0.2'
  s.summary      = 'SWIFT develop support pack'
  s.license      = 'MIT'
  s.description  = 'This is Simple develop kit'
  s.homepage     = 'https://github.com/inchan/KangcPack'




  s.authors             = { 'Kangc' => 'kangsazang@gmail.co.kr' }
  s.social_media_url    = 'http://twitter.com/kangsazang'

  s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.source = { :git => 'https://github.com/inchan/KangcPack.git', :tag => s.version }
  s.source_files  = 'KangcPack/**/*'
end
