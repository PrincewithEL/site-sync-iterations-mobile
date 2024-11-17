/// message : "Chat room details retrieved successfully."
/// status_code : 200
/// data : {"project":{"id":5,"name":"Nairobi Sky Scraper"},"project_member_details":[{"first_name":"John Doe","last_name":"","phone_number":"0712345678","image":"/media/profile_pictures/337b1a46-146a-470c-8033-0df21d0d868a.jpg","id":2,"role":"contractor","online":1,"user_type":"Client","logged_in":"2024-11-04T15:45:23.501092Z","logged_out":"2024-11-04T15:30:35.862505Z"}],"chat_messages":[{"id":4,"message":"","timestamp":"2024-10-30T17:42:39.094018Z","sender":4,"receiver":null,"receiver_type":null,"is_starred":false,"file":null,"replying_to_message":null,"file_extension":"","is_read":false},{"id":5,"message":"","timestamp":"2024-10-30T17:42:43.257388Z","sender":4,"receiver":null,"receiver_type":null,"is_starred":false,"file":null,"replying_to_message":null,"file_extension":"","is_read":false},{"id":6,"message":"Hello this is my message","timestamp":"2024-10-30T17:43:15.149470Z","sender":4,"receiver":null,"receiver_type":null,"is_starred":false,"file":null,"replying_to_message":null,"file_extension":"","is_read":false},{"id":163,"message":"Welcome to the test project...","timestamp":"2024-11-04T16:00:26.260974Z","sender":2,"receiver":null,"receiver_type":null,"is_starred":false,"file":null,"replying_to_message":null,"file_extension":"","is_read":false}]}

class ChatroomResponseEntity {
  ChatroomResponseEntity({
    String? message,
    num? statusCode,
    ChatDataEntity? data,
  }) {
    _message = message;
    _statusCode = statusCode;
    _data = data;
  }

  ChatroomResponseEntity.fromJson(dynamic json) {
    _message = json['message'];
    _statusCode = json['status_code'];
    _data = json['data'] != null ? ChatDataEntity.fromJson(json['data']) : null;
  }

  String? _message;
  num? _statusCode;
  ChatDataEntity? _data;

  ChatroomResponseEntity copyWith({
    String? message,
    num? statusCode,
    ChatDataEntity? data,
  }) =>
      ChatroomResponseEntity(
        message: message ?? _message,
        statusCode: statusCode ?? _statusCode,
        data: data ?? _data,
      );

  String? get message => _message;

  num? get statusCode => _statusCode;

  ChatDataEntity? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status_code'] = _statusCode;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// project : {"id":5,"name":"Nairobi Sky Scraper"}
/// project_member_details : [{"first_name":"John Doe","last_name":"","phone_number":"0712345678","image":"/media/profile_pictures/337b1a46-146a-470c-8033-0df21d0d868a.jpg","id":2,"role":"contractor","online":1,"user_type":"Client","logged_in":"2024-11-04T15:45:23.501092Z","logged_out":"2024-11-04T15:30:35.862505Z"}]
/// chat_messages : [{"id":4,"message":"","timestamp":"2024-10-30T17:42:39.094018Z","sender":4,"receiver":null,"receiver_type":null,"is_starred":false,"file":null,"replying_to_message":null,"file_extension":"","is_read":false},{"id":5,"message":"","timestamp":"2024-10-30T17:42:43.257388Z","sender":4,"receiver":null,"receiver_type":null,"is_starred":false,"file":null,"replying_to_message":null,"file_extension":"","is_read":false},{"id":6,"message":"Hello this is my message","timestamp":"2024-10-30T17:43:15.149470Z","sender":4,"receiver":null,"receiver_type":null,"is_starred":false,"file":null,"replying_to_message":null,"file_extension":"","is_read":false},{"id":163,"message":"Welcome to the test project...","timestamp":"2024-11-04T16:00:26.260974Z","sender":2,"receiver":null,"receiver_type":null,"is_starred":false,"file":null,"replying_to_message":null,"file_extension":"","is_read":false}]

class ChatDataEntity {
  ChatDataEntity({
    ChatProjectEntity? project,
    List<ChatProjectMemberDetailsEntity>? projectMemberDetails,
    List<ChatMessagesEntity>? chatMessages,
  }) {
    _project = project;
    _projectMemberDetails = projectMemberDetails;
    _chatMessages = chatMessages;
  }

  ChatDataEntity.fromJson(dynamic json) {
    _project =
        json['project'] != null ? ChatProjectEntity.fromJson(json['project']) : null;
    if (json['project_member_details'] != null) {
      _projectMemberDetails = [];
      json['project_member_details'].forEach((v) {
        _projectMemberDetails?.add(ChatProjectMemberDetailsEntity.fromJson(v));
      });
    }
    if (json['chat_messages'] != null) {
      _chatMessages = [];
      json['chat_messages'].forEach((v) {
        _chatMessages?.add(ChatMessagesEntity.fromJson(v));
      });
    }
  }

  ChatProjectEntity? _project;
  List<ChatProjectMemberDetailsEntity>? _projectMemberDetails;
  List<ChatMessagesEntity>? _chatMessages;

  ChatDataEntity copyWith({
    ChatProjectEntity? project,
    List<ChatProjectMemberDetailsEntity>? projectMemberDetails,
    List<ChatMessagesEntity>? chatMessages,
  }) =>
      ChatDataEntity(
        project: project ?? _project,
        projectMemberDetails: projectMemberDetails ?? _projectMemberDetails,
        chatMessages: chatMessages ?? _chatMessages,
      );

  ChatProjectEntity? get project => _project;

  List<ChatProjectMemberDetailsEntity>? get projectMemberDetails => _projectMemberDetails;

  List<ChatMessagesEntity>? get chatMessages => _chatMessages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_project != null) {
      map['project'] = _project?.toJson();
    }
    if (_projectMemberDetails != null) {
      map['project_member_details'] =
          _projectMemberDetails?.map((v) => v.toJson()).toList();
    }
    if (_chatMessages != null) {
      map['chat_messages'] = _chatMessages?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 4
/// message : ""
/// timestamp : "2024-10-30T17:42:39.094018Z"
/// sender : 4
/// receiver : null
/// receiver_type : null
/// is_starred : false
/// file : null
/// replying_to_message : null
/// file_extension : ""
/// is_read : false

class ChatMessagesEntity {
  ChatMessagesEntity({
    num? id,
    String? message,
    String? timestamp,
    String? senderName,
    num? sender,
    dynamic receiver,
    dynamic receiverType,
    bool? isStarred,
    dynamic file,
    dynamic replyingToMessage,
    String? fileExtension,
    bool? isRead,
  }) {
    _id = id;
    _message = message;
    _timestamp = timestamp;
    _senderName = senderName;
    _sender = sender;
    _receiver = receiver;
    _receiverType = receiverType;
    _isStarred = isStarred;
    _file = file;
    _replyingToMessage = replyingToMessage;
    _fileExtension = fileExtension;
    _isRead = isRead;
  }

  ChatMessagesEntity.fromJson(dynamic json) {
    _id = json['id'];
    _message = json['message'];
    _timestamp = json['timestamp'];
    _senderName = json['sender_name'];
    _sender = json['sender'];
    _receiver = json['receiver'];
    _receiverType = json['receiver_type'];
    _isStarred = json['is_starred'];
    _file = json['file'];
    _replyingToMessage = json['replying_to_message'];
    _fileExtension = json['file_extension'];
    _isRead = json['is_read'];
  }

  num? _id;
  String? _message;
  String? _senderName;
  String? _timestamp;
  num? _sender;
  dynamic _receiver;
  dynamic _receiverType;
  bool? _isStarred;
  dynamic _file;
  dynamic _replyingToMessage;
  String? _fileExtension;
  bool? _isRead;

  ChatMessagesEntity copyWith({
    num? id,
    String? message,
    String? senderName,
    String? timestamp,
    num? sender,
    dynamic receiver,
    dynamic receiverType,
    bool? isStarred,
    dynamic file,
    dynamic replyingToMessage,
    String? fileExtension,
    bool? isRead,
  }) =>
      ChatMessagesEntity(
        id: id ?? _id,
        message: message ?? _message,
        timestamp: timestamp ?? _timestamp,
        senderName: senderName ?? _senderName,
        sender: sender ?? _sender,
        receiver: receiver ?? _receiver,
        receiverType: receiverType ?? _receiverType,
        isStarred: isStarred ?? _isStarred,
        file: file ?? _file,
        replyingToMessage: replyingToMessage ?? _replyingToMessage,
        fileExtension: fileExtension ?? _fileExtension,
        isRead: isRead ?? _isRead,
      );

  num? get id => _id;

  String? get message => _message;

  String? get senderName => _senderName;

  String? get timestamp => _timestamp;

  num? get sender => _sender;

  dynamic get receiver => _receiver;

  dynamic get receiverType => _receiverType;

  bool? get isStarred => _isStarred;

  dynamic get file => _file;

  dynamic get replyingToMessage => _replyingToMessage;

  String? get fileExtension => _fileExtension;

  bool? get isRead => _isRead;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['message'] = _message;
    map['sender_name'] = _senderName;
    map['timestamp'] = _timestamp;
    map['sender'] = _sender;
    map['receiver'] = _receiver;
    map['receiver_type'] = _receiverType;
    map['is_starred'] = _isStarred;
    map['file'] = _file;
    map['replying_to_message'] = _replyingToMessage;
    map['file_extension'] = _fileExtension;
    map['is_read'] = _isRead;
    return map;
  }
}

/// first_name : "John Doe"
/// last_name : ""
/// phone_number : "0712345678"
/// image : "/media/profile_pictures/337b1a46-146a-470c-8033-0df21d0d868a.jpg"
/// id : 2
/// role : "contractor"
/// online : 1
/// user_type : "Client"
/// logged_in : "2024-11-04T15:45:23.501092Z"
/// logged_out : "2024-11-04T15:30:35.862505Z"

class ChatProjectMemberDetailsEntity {
  ChatProjectMemberDetailsEntity({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? image,
    num? id,
    String? role,
    num? online,
    String? userType,
    String? loggedIn,
    String? loggedOut,
  }) {
    _firstName = firstName;
    _lastName = lastName;
    _phoneNumber = phoneNumber;
    _image = image;
    _id = id;
    _role = role;
    _online = online;
    _userType = userType;
    _loggedIn = loggedIn;
    _loggedOut = loggedOut;
  }

  ChatProjectMemberDetailsEntity.fromJson(dynamic json) {
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _phoneNumber = json['phone_number'];
    _image = json['image'];
    _id = json['id'];
    _role = json['role'];
    _online = json['online'];
    _userType = json['user_type'];
    _loggedIn = json['logged_in'];
    _loggedOut = json['logged_out'];
  }

  String? _firstName;
  String? _lastName;
  String? _phoneNumber;
  String? _image;
  num? _id;
  String? _role;
  num? _online;
  String? _userType;
  String? _loggedIn;
  String? _loggedOut;

  ChatProjectMemberDetailsEntity copyWith({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? image,
    num? id,
    String? role,
    num? online,
    String? userType,
    String? loggedIn,
    String? loggedOut,
  }) =>
      ChatProjectMemberDetailsEntity(
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        phoneNumber: phoneNumber ?? _phoneNumber,
        image: image ?? _image,
        id: id ?? _id,
        role: role ?? _role,
        online: online ?? _online,
        userType: userType ?? _userType,
        loggedIn: loggedIn ?? _loggedIn,
        loggedOut: loggedOut ?? _loggedOut,
      );

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get phoneNumber => _phoneNumber;

  String? get image => _image;

  num? get id => _id;

  String? get role => _role;

  num? get online => _online;

  String? get userType => _userType;

  String? get loggedIn => _loggedIn;

  String? get loggedOut => _loggedOut;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['phone_number'] = _phoneNumber;
    map['image'] = _image;
    map['id'] = _id;
    map['role'] = _role;
    map['online'] = _online;
    map['user_type'] = _userType;
    map['logged_in'] = _loggedIn;
    map['logged_out'] = _loggedOut;
    return map;
  }
}

/// id : 5
/// name : "Nairobi Sky Scraper"

class ChatProjectEntity {
  ChatProjectEntity({
    num? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  ChatProjectEntity.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }

  num? _id;
  String? _name;

  ChatProjectEntity copyWith({
    num? id,
    String? name,
  }) =>
      ChatProjectEntity(
        id: id ?? _id,
        name: name ?? _name,
      );

  num? get id => _id;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }
}
