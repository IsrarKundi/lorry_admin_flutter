class PushNotificationItem {
  const PushNotificationItem({
    required this.id,
    required this.sentAt,
    required this.title,
    required this.body,
    this.isTitleLink = false,
  });

  final String id;
  final DateTime sentAt;
  final String title;
  final String body;
  final bool isTitleLink;
}
