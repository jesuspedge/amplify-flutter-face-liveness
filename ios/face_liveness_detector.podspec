#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint face_liveness_detector.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'face_liveness_detector'
  s.version          = '0.2.3'
  s.summary          = 'AWS Rekognition Face Liveness detection for Flutter'
  s.description      = <<-DESC
A Flutter plugin for AWS Rekognition Face Liveness detection, allowing secure face biometric verification through AWS's Rekognition service.
Note: This plugin requires manual setup of AWS Amplify Face Liveness dependencies in Xcode.
                       DESC
  s.homepage         = 'https://github.com/raichandramohan27ca/amplify-flutter-face-liveness'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'raichandramohan27ca' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
  
  # This is essential for proper module naming in Swift
  s.module_name = 'face_liveness_detector'
  s.static_framework = true

  # Post-install message to guide users
  s.post_install do |installer|
    installer.pods_project.targets.each do |target|
      if target.name == 'face_liveness_detector'
        puts ""
        puts "⚠️  IMPORTANT: AWS Amplify Face Liveness Setup Required"
        puts "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        puts "This plugin requires AWS Amplify Face Liveness dependencies to be added manually:"
        puts ""
        puts "1. Open your iOS project in Xcode: ios/Runner.xcworkspace"
        puts "2. Go to File → Add Package Dependencies..."
        puts "3. Add the following packages:"
        puts ""
        puts "   📦 AWS Amplify Swift:"
        puts "   URL: https://github.com/aws-amplify/amplify-swift"
        puts "   Version: 2.46.1 or later"
        puts "   Products: Amplify, AWSCognitoAuthPlugin"
        puts ""
        puts "   📦 AWS Amplify UI Liveness:"
        puts "   URL: https://github.com/aws-amplify/amplify-ui-swift-liveness"
        puts "   Version: 1.3.5 or later"
        puts "   Product: FaceLiveness"
        puts ""
        puts "4. Build your project to verify the setup"
        puts ""
        puts "For detailed instructions, see:"
        puts "https://github.com/raichandramohan27ca/amplify-flutter-face-liveness#ios-setup"
        puts "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        puts ""
      end
    end
  end
end