
  Pod::Spec.new do |s|
    s.name = 'KubenavKubenavPlugin'
    s.version = '0.0.1'
    s.summary = 'Capacitor plugin for the kubenav app.'
    s.license = 'MIT'
    s.homepage = 'https://github.com/kubenav/kubenav-plugin'
    s.author = 'Rico Berger'
    s.source = { :git => 'https://github.com/kubenav/kubenav-plugin', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '11.0'
    s.dependency 'Capacitor'
    s.vendored_frameworks = 'ios/Plugin/libs/**'
    s.xcconfig = { 'ENABLE_BITCODE' => 'NO' }
  end
