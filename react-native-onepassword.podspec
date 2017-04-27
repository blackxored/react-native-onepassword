Pod::Spec.new do |s|
  s.name = "react-native-onepassword"
  s.version = "1.0.4"
  s.summary = "React Native integration with the OnePassword extension."
  s.license = 'MIT'
  s.requires_arc = true
  s.homepage = 'https://github.com/batphone/react-native-onepassword'
  s.authors = { "jjshammas" => "john@johnshammas.com" }
  s.source = { :git => "https://github.com/batphone/react-native-onepassword", :tag => '1.0.4'}
  s.source_files = 'OnePassword.{h,m}'
  s.platform = :ios, "7.0"
  s.dependency 'React/Core'
  s.dependency '1PasswordExtension'
end
