import 'package:flutter_app/pages/sampleFirebase/model/user.dart';
import 'package:flutter_app/pages/sampleFirebase/service/interface/iUserRepository.dart';

class UserService {
  IUserRepository _userRepository;

  UserService({IUserRepository repo}) {
    this._userRepository = repo;
  }

  // if exists , return user, else null
  Future<User> alreadyExists(String email) async {
    print('hogafe');
    return this._userRepository.findByEmail(email);
  }

  Future<User> create(String name) async {
    final User user = User.initialize(name: name);
    return this._userRepository.create(user);
  }

  Future<User> update(User user) async {
    return this._userRepository.update(user);
  }

  Future<void> delete(User user) async {
    return this._userRepository.delete(user.userId);
  }
}
