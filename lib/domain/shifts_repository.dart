import 'package:florence_realtime_observation_gallery/domain/shifts.dart';
import 'package:florence_realtime_observation_gallery/network/dio.dart';

class ShiftsRepository {
  final DioClient client;

  ShiftsRepository(this.client);

  Future<ShiftsResponse> getShifts() async {
    final response = await client.dio.get('api/v1/posted_shifts');
    return ShiftsResponse.fromJson(response.data);
  }
}
