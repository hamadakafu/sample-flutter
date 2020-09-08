import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sentry/io_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      // contacts API クレデンシャルらしい
      // 'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  GetIt.I.registerSingleton<GoogleSignIn>(googleSignIn);
  SentryClient sentryClient = SentryClient(
    dsn:
        "https://12fa8e20604847cd8a14a55ee25a64c4@o437485.ingest.sentry.io/5421151",
  );
  GetIt.I.registerSingleton<SentryClient>(sentryClient);
  runApp(Home());
}
