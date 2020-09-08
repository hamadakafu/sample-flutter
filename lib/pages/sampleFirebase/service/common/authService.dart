import 'package:flutter_app/pages/sampleFirebase/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<User> googleSignIn() async {
    try {
      return await GetIt.I<GoogleSignIn>().signIn().then((account) =>
          account.authentication.then((authentication) async {
            final credential = firebase_auth.GoogleAuthProvider.credential(
              accessToken: authentication.accessToken,
              idToken: authentication.idToken,
            );
            final authResult = await firebase_auth.FirebaseAuth.instance
                .signInWithCredential(credential);
            final firebase_auth.User user = authResult.user;
            return User.initialize(name: user.displayName, email: user.email);
          }));
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<void> googleSignOut() async {
    // TODO: 確認これだけでいいのかfirebaseになにかする必要があるのか
    await GetIt.I<GoogleSignIn>().signOut();
  }
}
