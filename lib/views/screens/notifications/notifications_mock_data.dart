import '../../../models/push_notification_item.dart';

abstract final class NotificationsMockData {
  NotificationsMockData._();

  static final List<PushNotificationItem> initial = [
    PushNotificationItem(
      id: '1',
      sentAt: DateTime(2020, 6, 17, 7, 39),
      title: 'Excavation Works',
      body: 'Your event has already finished.',
    ),
    PushNotificationItem(
      id: '2',
      sentAt: DateTime(2020, 6, 17, 7, 39),
      title: 'Diving Works',
      body: 'Ticket sales of your event has ended.',
    ),
    PushNotificationItem(
      id: '3',
      sentAt: DateTime(2020, 6, 17, 7, 39),
      title: 'Cryogenic Liquid Handling',
      body: 'Your event has already finished.',
      isTitleLink: true,
    ),
    PushNotificationItem(
      id: '4',
      sentAt: DateTime(2020, 6, 17, 7, 39),
      title: 'Excavation Works',
      body: 'Your event has already finished.',
    ),
    PushNotificationItem(
      id: '5',
      sentAt: DateTime(2020, 6, 17, 7, 39),
      title: 'Diving Works',
      body: 'Ticket sales of your event has ended.',
    ),
    PushNotificationItem(
      id: '6',
      sentAt: DateTime(2020, 6, 17, 7, 39),
      title: 'Excavation Works',
      body: 'Your event has already finished.',
    ),
    PushNotificationItem(
      id: '7',
      sentAt: DateTime(2020, 6, 17, 7, 39),
      title: 'Diving Works',
      body: 'Ticket sales of your event has ended.',
    ),
    PushNotificationItem(
      id: '8',
      sentAt: DateTime(2020, 6, 17, 7, 39),
      title: 'Excavation Works',
      body: 'Your event has already finished.',
    ),
  ];
}
