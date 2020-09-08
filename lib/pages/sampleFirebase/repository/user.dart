import 'package:flutter_app/pages/sampleFirebase/model/user.dart';
import 'package:flutter_app/pages/sampleFirebase/service/interface/iUserRepository.dart';

class UserRepository extends IUserRepository {
  @override
  Future<User> create(User user) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String userId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<User> read(String userId) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<User> update(User user) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<User> findByEmail(String email) {
    // FIXME:
    print('doing');
    return Future.delayed(
        Duration(seconds: 1), () => User.initialize(name: 'hoge'));
  }
}
