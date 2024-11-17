/// mid : 10

class DeleteMessageEntity {
  DeleteMessageEntity({
    num? mid,
    String? userId,
  }) {
    _mid = mid;
    _userId = userId;
  }

  DeleteMessageEntity.fromJson(dynamic json) {
    _mid = json['mid'];
    _userId = json['user_id'];
  }

  num? _mid;
  String? _userId;

  DeleteMessageEntity copyWith({
    num? mid,
    String? userId,
  }) =>
      DeleteMessageEntity(
        mid: mid ?? _mid,
        userId: userId ?? _userId,
      );

  num? get mid => _mid;
  String? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mid'] = _mid;
    map['user_id'] = _userId;
    return map;
  }
}
