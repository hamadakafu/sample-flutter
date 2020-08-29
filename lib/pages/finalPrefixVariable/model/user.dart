/// finalは一度インスタンス化された変数に対して、immutableになる
class User {
  final Kind kind = Kind.Human;
  String firstName;
  String secondName;

  User(this.firstName, this.secondName);

  void update(String firstName, String secondName) {
    this.firstName = firstName;
    this.secondName = secondName;
  }
}

enum Kind { Human, Animal }
