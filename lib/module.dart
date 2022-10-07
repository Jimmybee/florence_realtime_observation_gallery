import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controller/shifts_controller.dart';
import 'controller/users_controller.dart';
import 'domain/shifts_repository.dart';
import 'domain/user.dart';
import 'domain/user_repository.dart';
import 'network/dio.dart';

final dioProvider = Provider<DioClient>((ref) => DioClient());
final userProvider = Provider((ref) => UserRepository(ref.read(dioProvider)));
final userControllerProvider =
    StateNotifierProvider<UserController, List<User>>((ref) => UserController(ref.read(userProvider)));

final shiftsProvider = Provider((ref) => ShiftsRepository(ref.read(dioProvider)));
final shiftsControllerProvider = ChangeNotifierProvider((ref) => ShiftsController(ref.read(shiftsProvider)));
