class UserResponse {
  UserResponse({
    required this.users,
  });
  late final List<User> users;

  UserResponse.fromJson(Map<String, dynamic> json) {
    users = List.from(json['users']).map((e) => User.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['users'] = users.map((e) => e.toJson()).toList();
    return _data;
  }
}

class User {
  User({
    required this.latitude,
    required this.longitude,
    required this.lastActiveAt,
  });
  late final double latitude;
  late final double longitude;
  late final String lastActiveAt;

  User.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    lastActiveAt = json['last_active_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['last_active_at'] = lastActiveAt;
    return _data;
  }
}
