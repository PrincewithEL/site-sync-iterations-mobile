import 'package:site_sync/features/chatroom/domain/entities/edit_message_entity.dart';

class EditMessageModel extends EditMessageEntity {
  EditMessageModel({
    required super.editedMessage,
    required super.mid,
  });

  factory EditMessageModel.fromJson(final Map<String, dynamic> json) {
    return EditMessageModel(editedMessage: json["edited_message"], mid: json["mid"]);
  }
}
