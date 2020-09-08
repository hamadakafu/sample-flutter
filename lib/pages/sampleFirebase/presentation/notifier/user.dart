import 'package:flutter/cupertino.dart';
import 'package:flutter_app/pages/sampleFirebase/model/user.dart';
import 'package:flutter_app/pages/sampleFirebase/service/common/userService.dart';
import 'package:flutter_app/pages/sampleFirebase/service/interface/iUserRepository.dart';

class UserNotifier with ChangeNotifier {
  UserService userService;
  Future<User> futureUser;
  User _loginUser;
  static UserNotifier _cache;

  factory UserNotifier({
    @required UserService userService,
  }) {
    return _cache ??= UserNotifier._internal(
      userService: userService,
    );
  }

  UserNotifier._internal({@required UserService userService}) {
    this.userService = userService;
  }

  get loginUser {
    return _loginUser;
  }

  set loginUser(User user) {
    _loginUser = user;
    notifyListeners();
  }
}
