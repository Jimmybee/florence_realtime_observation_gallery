import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controller/shifts_controller.dart';
import 'controller/users_controller.dart';
import 'domain/shifts_repository.dart';
import 'domain/user.dart';
import 'domain/user_repository.dart';
import 'network/dio.dart';

final frDioProvider = Provider<DioClient>((ref) => DioClient(frBaseUrl));
final ukDioProvider = Provider<DioClient>((ref) => DioClient(ukBaseUrl));
final userProvider = Provider((ref) => UserRepository(ref.read(frDioProvider)));
final ukUserProvider = Provider((ref) => UserRepository(ref.read(ukDioProvider)));
final userControllerProvider =
    StateNotifierProvider<UserController, List<User>>((ref) => UserController(ref.read(userProvider)));
final ukUserControllerProvider =
    StateNotifierProvider<UserController, List<User>>((ref) => UserController(ref.read(ukUserProvider)));

final shiftsProvider = Provider((ref) => ShiftsRepository(ref.read(frDioProvider)));
final shiftsControllerProvider = ChangeNotifierProvider((ref) => ShiftsController(ref.read(shiftsProvider)));
final ukShiftsProvider = Provider((ref) => ShiftsRepository(ref.read(ukDioProvider)));
final ukShiftsControllerProvider = ChangeNotifierProvider((ref) => ShiftsController(ref.read(ukShiftsProvider)));
