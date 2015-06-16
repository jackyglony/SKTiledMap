Pod::Spec.new do |s|
  s.name     = 'SKTiledMap'
  s.version  = '1.0.0'
  s.license  = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage = 'https://github.com/wbcyclist/SKTiledMap'
  s.author   = { 'Jasio Woo' => 'wbcyclist@gmail.com' }
  s.summary  = 'A TMX Tilemap Framework For SpriteKit. Supporting iOS and OS X'
  s.source   = { :git => 'https://github.com/wbcyclist/SKTiledMap.git', :tag => s.version }
  s.screenshots = [ "https://raw.githubusercontent.com/wbcyclist/PathFindingForObjC/master/demo/PathFinding_ScreenShot.png" ]
  
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'

  s.public_header_files = 'Framework/*.h'
  s.source_files = 'Framework/SKTiledMap.h'

  s.subspec 'External' do |ss|
    ss.source_files = 'Framework/External/*.{h,m}'
    ss.ios.frameworks = 'UIKit', 'SpriteKit'
    ss.osx.frameworks = 'AppKit', 'SpriteKit'
    ss.library = 'z'
  end

  s.subspec 'Model' do |ss|
    ss.dependency 'SKTiledMap/External'
    ss.dependency 'Ono', '~> 1.2.2'
    ss.source_files = 'Framework/Model/*.{h,m}'
  end

  s.subspec 'SpriteKitNode' do |ss|
    ss.dependency 'SKTiledMap/Model'
    ss.source_files = 'Framework/SpriteKitNode/*.{h,m}'
  end

  s.subspec 'Renderer' do |ss|
    ss.dependency 'SKTiledMap/SpriteKitNode'
    ss.source_files = 'Framework/Classes/*.{h,m}'
  end

end