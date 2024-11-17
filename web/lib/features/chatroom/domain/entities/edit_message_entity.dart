/// mid : 202
/// edited_message : "Updated message content"

class EditMessageEntity {
  EditMessageEntity({
      num? mid, 
      String? editedMessage,}){
    _mid = mid;
    _editedMessage = editedMessage;
}

  EditMessageEntity.fromJson(dynamic json) {
    _mid = json['mid'];
    _editedMessage = json['edited_message'];
  }
  num? _mid;
  String? _editedMessage;
EditMessageEntity copyWith({  num? mid,
  String? editedMessage,
}) => EditMessageEntity(  mid: mid ?? _mid,
  editedMessage: editedMessage ?? _editedMessage,
);
  num? get mid => _mid;
  String? get editedMessage => _editedMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mid'] = _mid;
    map['edited_message'] = _editedMessage;
    return map;
  }

}