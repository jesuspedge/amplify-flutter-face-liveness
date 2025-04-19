#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint face_liveness_detector.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'face_liveness_detector'
  s.version          = '0.1.4'
  s.summary          = 'AWS Rekognition Face Liveness detection for Flutter'
  s.description      = <<-DESC
A Flutter plugin for AWS Rekognition Face Liveness detection, allowing secure face biometric verification through AWS's Rekognition service.
                       DESC
  s.homepage         = 'https://github.com/raichandramohan27ca/amplify-flutter-face-liveness'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'raichandramohan27ca' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'rekognition_face_liveness/Sources/rekognition_face_liveness/**/*.swift'
  s.dependency 'Flutter'
  s.dependency 'FaceLiveness'
  s.dependency 'Amplify'
  s.dependency 'AWSCognitoAuthPlugin'
  s.platform = :ios, '14.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end 