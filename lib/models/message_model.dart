class MessageModel {
  /// Massage
  String? massage;

  /// Is user
  bool? isUser;

  MessageModel({
    this.massage,
    this.isUser,
  });

  factory MessageModel.fromJson(Map<dynamic, dynamic> json) {
    /// Create a MessageModel object from a Json object
    return MessageModel(
      massage: json['massage'],
      isUser: json['isUser'],
    );
  }
  Map<String, dynamic> toJson() {
    /// Create a Json object from a MessageModel object
    return {
      'massage': massage,
      'isUser': isUser,
    };
  }
}
