Pod::Spec.new do |s|
  s.name             = 'CrLoadingButton'
  s.version          = '1.0.2'
  s.platform         = :ios, '7.0'
  s.summary          = 'UIButton that include loading state'
  s.homepage         = 'https://github.com/skswhwo/CrLoadingButton'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'skswhwo' => 'skswhwo@gmail.com' }
  s.source           = { :git => 'https://github.com/skswhwo/CrLoadingButton.git', :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'
  s.source_files     = 'CrLoadingButton/Classes/**/*.{h,m}'
  s.requires_arc     = true
end
