import 'package:flutter_app/pages/sampleFirebase/model/user.dart';

abstract class IUserRepository {
  Future<User> create(User user);

  Future<User> read(String userId);

  Future<User> update(User user);

  Future<void> delete(String userId);

  Future<User> findByEmail(String email);
}
