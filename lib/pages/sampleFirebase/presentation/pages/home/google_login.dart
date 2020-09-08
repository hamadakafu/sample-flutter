import 'package:flutter/cupertino.dart';
import 'package:flutter_app/pages/sampleFirebase/model/user.dart';
import 'package:flutter_app/pages/sampleFirebase/presentation/notifier/user.dart';
import 'package:flutter_app/pages/sampleFirebase/presentation/pages/counter.dart';
import 'package:flutter_app/pages/sampleFirebase/service/common/authService.dart';
import 'package:flutter_app/pages/sampleFirebase/service/exception/sentry.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GoogleLoginState();
}

class GoogleLoginState extends State {
  User _googleUser;
  AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    setState(() {
      print('set');
      _googleUser = Provider.of<UserNotifier>(context, listen: false).loginUser;
      print('setted ${_googleUser?.name}');
    });
    GetIt.I<GoogleSignIn>()
      ..onCurrentUserChanged.listen((event) {
        setState(() {
          final user = User.initialize(
            name: event.displayName,
            email: event.email,
          );
          Provider.of<UserNotifier>(context, listen: false).loginUser = user;
        });
      })
      ..signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    print('now build');
    return NeumorphicButton(
      onPressed: () async {
        if (_googleUser != null) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) {
            return CounterHome();
          }));
        }
        try {
          print('now try google');
          final User user = await _authService.googleSignIn();
          Provider.of<UserNotifier>(context, listen: false).loginUser = user;
          print(Provider.of<UserNotifier>(context, listen: false)
              .loginUser
              ?.name);
          if (user != null) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) {
              return CounterHome();
            }));
          }
          print('done google');
        } catch (e) {
          print(e);
          sentryReportError(e, null);
        }
      },
      child: Text('Google でログイン'),
    );
  }
}
