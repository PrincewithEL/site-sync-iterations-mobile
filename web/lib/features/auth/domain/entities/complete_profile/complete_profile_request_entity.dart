/// user_type : "Client"
/// profile_picture : ""

class CompleteProfileRequestEntity {
  CompleteProfileRequestEntity({
    String? userType,
    String? profilePicture,
  }) {
    _userType = userType;
    _profilePicture = profilePicture;
  }

  CompleteProfileRequestEntity.fromJson(dynamic json) {
    _userType = json['user_type'];
    _profilePicture = json['profile_picture'];
  }

  String? _userType;
  String? _profilePicture;

  CompleteProfileRequestEntity copyWith({
    String? userType,
    String? profilePicture,
  }) =>
      CompleteProfileRequestEntity(
        userType: userType ?? _userType,
        profilePicture: profilePicture ?? _profilePicture,
      );

  String? get userType => _userType;

  String? get profilePicture => _profilePicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_type'] = _userType;
    map['profile_picture'] = _profilePicture;
    return map;
  }
}
