A Project is created for Flutter based application

flutter build apk --release
flutter build apk
keytool
 keytool -printcert -jarfile /home/ispl/wfNamdev/flutter_webview/flutter_application_1/build/app/outputs/flutter-apk/app-release.apk





Platform  Firebase App Id
web       1:873751623961:web:2b968dd57dff31a78f2d88
android   1:873751623961:android:d1838a3ba223a1898f2d88
ios       1:873751623961:ios:b728ca23944dae8f8f2d88
macos     1:873751623961:ios:9df052dd8c3da7268f2d88



./gradlew signinReport




import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(WebApp());
}


import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(WebApp());