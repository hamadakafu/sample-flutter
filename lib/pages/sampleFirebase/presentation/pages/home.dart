import 'package:flutter/cupertino.dart';
import 'package:flutter_app/pages/sampleFirebase/presentation/notifier/user.dart';
import 'package:flutter_app/pages/sampleFirebase/presentation/pages/home/google_login.dart';
import 'package:flutter_app/pages/sampleFirebase/presentation/pages/home/mail_login.dart';
import 'package:flutter_app/pages/sampleFirebase/presentation/widget/myNeuTheme.dart';
import 'package:flutter_app/pages/sampleFirebase/repository/user.dart';
import 'package:flutter_app/pages/sampleFirebase/service/common/userService.dart';
import 'package:flutter_app/pages/sampleFirebase/service/interface/iUserRepository.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SampleFirebaseHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 初期化
    IUserRepository _userRepo = UserRepository();
    UserService userService = UserService(repo: _userRepo);
    UserNotifier userNotifier = UserNotifier(userService: userService);

    //! NuemorphicAppの中ではなく外に出さないと`Could not found`と言われる
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: userNotifier),
        Provider(
          create: (BuildContext context) {
            return userService;
          },
        ),
      ],
      child: NeumorphicApp(
        themeMode: ThemeMode.light,
        theme: NeumorphicThemeData(
          baseColor: Color(0xFFFFFFFF),
          lightSource: LightSource.topLeft,
        ),
        darkTheme: NeumorphicThemeData(
          baseColor: Color(0xFF3E3E3E),
          lightSource: LightSource.topLeft,
        ),
        title: 'hoge title',
        // routes: {
        //   '/sample-firebase/todo-list': (BuildContext context) => _Home(),
        // },
        home: SafeArea(
          child: Scaffold(
            backgroundColor: NeumorphicTheme.baseColor(context),
            body: _Home(),
          ),
        ),
      ),
    );
  }
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyNeumorphicTheme(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 400,
            ),
            NeumorphicButton(
              onPressed: () {
                print('メールアドレスログイン');
                showCupertinoModalBottomSheet(
                    expand: true,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context, scrollController) =>
                        MailInput(scrollController: scrollController));
              },
              padding: EdgeInsets.all(8),
              child: Text('メールアドレスでログイン'),
            ),
            Spacer(),
            NeumorphicButton(
              onPressed: () {
                print("onClick");
              },
              padding: EdgeInsets.all(12),
              child: Text('Appleでログイン'),
            ),
            Spacer(),
            GoogleLogin(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
