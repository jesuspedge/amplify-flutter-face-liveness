# AWS Rekognition Face Liveness Plugin for Flutter

[![pub package](https://img.shields.io/pub/v/rekognition_face_liveness.svg)](https://pub.dev/packages/rekognition_face_liveness)

A Flutter plugin for AWS Rekognition Face Liveness detection, allowing secure face biometric verification using AWS's Rekognition service. This package provides a bridge to the native AWS Amplify Face Liveness SDKs for both Android and iOS.

## Features

- Perform face liveness detection using AWS Rekognition
- Native integration with AWS Amplify Face Liveness SDKs
- Support for both iOS and Android platforms
- Simple Flutter widget interface for easy integration
- Uses AWS Amplify for authentication and credentials

## Requirements

- AWS account with Rekognition access
- AWS Amplify configuration for authentication
- Backend service to create Face Liveness sessions

## Getting Started

### Installation

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  face_liveness_detector: ^0.1.0
```
## ⚙️ Setup PreRequisite

Before using the package, you need to configure **Amplify** in your project. Follow these steps:

### 1️⃣ Set Up Amplify

Complete the **[Amplify Quickstart](https://ui.docs.amplify.aws/swift/connected-components/liveness#quick-start)** and **[Step 1: Configure Auth](https://ui.docs.amplify.aws/swift/connected-components/liveness#step-1-configure-auth)** before proceeding.

### 2️⃣ Configure Authentication

#### Android

1. Add the **Amplify configuration file** to your project:
    - Place `amplifyconfiguration.json` in `android/app/src/main/res/raw/`

#### iOS

1. Add the **Amplify configuration files** to your project:
    - Place `amplifyconfiguration.json` and `awsconfiguration.json` in the `ios` directory.

2. Open **Xcode** and manually add these files to your project to ensure they are recognized.

3. Update your `ios/Podfile`:


### Android Setup

1. Make sure you have the AWS Amplify configuration set up properly in your Android project.

2. Add the following dependencies to your `android/app/build.gradle`:

```gradle
dependencies {
    // AWS Amplify Face Liveness SDK
    implementation 'com.amplifyframework.ui:liveness:1.4.0'
    implementation 'com.amplifyframework:core:2.27.0'
    implementation 'com.amplifyframework:aws-auth-cognito:2.27.0'
}
```

### iOS Setup

1. Make sure you have the AWS Amplify configuration set up properly in your iOS project.

2. Add the following dependencies to your `Podfile`:

```ruby
pod 'Amplify'
pod 'AmplifyPlugins/AWSCognitoAuthPlugin'
pod 'FaceLiveness'
```

## Usage

### 1. Initialize AWS Amplify

First, make sure you initialize Amplify in your app as described in the [AWS Amplify documentation](https://docs.amplify.aws/lib/project-setup/create-application/q/platform/flutter/).

### 2. Create a Face Liveness Session

You'll need a backend service to create a Face Liveness session. Here's an example of how to get a session ID from your backend:

```dart
Future<Map<String, String>> getSessionFromBackend() async {
  final response = await http.post(
    Uri.parse('https://your-backend-url.com/face-liveness/create-session'),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 201) {
    final data = jsonDecode(response.body);
    return {
      'sessionId': data['sessionId'],
      'region': data['region'] ?? 'us-east-1',
    };
  }
  
  throw Exception('Failed to get session');
}
```

### 3. Use the FaceLivenessDetector Widget

```dart
import 'package:rekognition_face_liveness/face_liveness_detector.dart';

// ...

FaceLivenessDetector(
  sessionId: sessionId,
  region: 'us-east-1',
  onComplete: () {
    print('Face liveness detection completed successfully');
    // Fetch results from your backend
  },
  onError: (errorCode) {
    print('Face liveness detection error: $errorCode');
  },
)
```

### 4. Fetch Liveness Results

After the liveness check is complete, you should verify the results with your backend:

```dart
Future<Map<String, dynamic>> fetchLivenessResults({
  required String sessionId,
}) async {
  final response = await http.get(
    Uri.parse('https://your-backend-url.com/face-liveness/results?sessionId=$sessionId'),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  }
  
  throw Exception('Failed to fetch liveness results');
}
```

## Example

Check the `example` directory for a complete example app.

## Backend Implementation

You'll need a backend service that can:

1. Create Face Liveness sessions using the AWS SDK
2. Fetch Face Liveness results after completion

A simple implementation using Spring Boot is provided in the example directory.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Additional Resources

- [AWS Rekognition Documentation](https://docs.aws.amazon.com/rekognition/latest/dg/what-is.html)
- [AWS Amplify Documentation](https://docs.amplify.aws/)
- [AWS Rekognition Face Liveness](https://docs.aws.amazon.com/rekognition/latest/dg/face-liveness.html)  
