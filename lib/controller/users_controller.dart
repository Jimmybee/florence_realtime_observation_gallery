import 'package:florence_realtime_observation_gallery/domain/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/user.dart';

class UserController extends StateNotifier<List<User>> {
  final UserRepository _userRepository;

  UserController(this._userRepository) : super([]) {
    // getUsers();
    testCurrent();
  }

  Future<void> testCurrent() async {
    final string = _userRepository.getCurrent();
    print(string);
  }

  Future<void> getUsers() async {
    state = [];
    final response = await _userRepository.getUsers();
    state = response.users;
  }
}
