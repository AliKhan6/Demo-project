class Notifications {
  int? id;
  String? title;
  String? content;
  String? notificationType;
  String? userId;
  int? isRead;

  Notifications({
    this.id,
    this.title,
    this.content,
    this.notificationType,
    this.userId,
    this.isRead,
  });

  Notifications.fromJson(json) {
    try {
      this.id = json['id'];
      this.title = json['title'];
      this.content = json['content'];
      this.notificationType = json['notification_type'];
      this.userId = json['user_id'] != null ? json['user_id'].toString() : null;
      this.isRead = json['is_read'] ?? 1;
    } catch (e, s) {
      print('Exception @Notifications.fromJson: $e');
      print('$s');
    }
  }

  Notifications.fromDirectJson(json) {
    try {
      this.id = json['id'];
      this.title = json['title'];
      this.content = json['body'];
      this.notificationType = json['type'];
    } catch (e, s) {
      print('Exception @MyOrders.fromJson: $e');
      print('$s');
    }
  }
}
