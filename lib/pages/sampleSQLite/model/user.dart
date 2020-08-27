import 'package:uuid/uuid.dart';

class User {
  String userId;
  String firstName;
  String lastName;

  User(this.userId, this.firstName, this.lastName);

  User.create(firstName, lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
    var uuid = Uuid();
    this.userId = uuid.v4();
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'firstName': this.firstName,
      'lastName': this.lastName,
    };
  }
}
