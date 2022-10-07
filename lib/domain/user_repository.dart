import 'package:florence_realtime_observation_gallery/domain/user.dart';
import 'package:florence_realtime_observation_gallery/network/dio.dart';

class UserRepository {
  final DioClient client;

  UserRepository(this.client);

  Future<UserResponse> getUsers() async {
    final response = await client.dio.get('api/v1/active_users');
    return UserResponse.fromJson(response.data);
  }

  Future<String> getCurrent() async {
    final response = await client.dio.get('api/v1/users/current');
    return response.data.toString();
  }
}
