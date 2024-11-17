/// uid : "1"

class LeaveProjectRequestEntity {
  LeaveProjectRequestEntity({
    String? uid,
    String? userId,
  }) {
    _userId = userId;
    _uid = uid;
  }

  LeaveProjectRequestEntity.fromJson(dynamic json) {
    _userId = json['user_id'];
    _uid = json['uid'];
  }

  String? _uid;
  String? _userId;

  LeaveProjectRequestEntity copyWith({
    String? uid,
    String? userId,
  }) =>
      LeaveProjectRequestEntity(
        uid: uid ?? _uid,
        userId: userId ?? _userId,
      );

  String? get uid => _uid;
  String? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['uid'] = _uid;
    return map;
  }
}
