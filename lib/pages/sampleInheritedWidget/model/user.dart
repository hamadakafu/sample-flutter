import 'package:uuid/uuid.dart';

class User {
  final String userId;

  String firstName;
  String secondName;

  User(this.userId, this.firstName, this.secondName);

  static User create(String firstName, String secondName) {
    return User(Uuid().v4(), firstName, secondName);
  }
}
