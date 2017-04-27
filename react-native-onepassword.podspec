require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name = "react-native-onepassword"
  s.version = package["version"]
  s.summary = "React Native integration with the OnePassword extension."
  s.homepage = "https://github.com/batphone/react-native-onepassword"
  s.authors = { "jjshammas" => "john@johnshammas.com" }
  s.license = "MIT"
  s.source = { :git => "https://github.com/batphone/react-native-onepassword.git", :tag => "#{s.version}"}

  s.platform = :ios, "7.0"
  s.source_files = "OnePassword.{h,m}"
  
  s.dependency "React"
  s.dependency "1PasswordExtension"
end
