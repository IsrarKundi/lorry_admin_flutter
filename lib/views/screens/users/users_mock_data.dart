import '../../../models/admin_user.dart';

abstract final class UsersMockData {
  UsersMockData._();

  static const List<AdminUser> all = [
    AdminUser(
      id: '456',
      name: 'Theresa Webb',
      email: 'tim.jennings@example.com',
      totalAds: 12,
      status: UserAccountStatus.active,
    ),
    AdminUser(
      id: '457',
      name: 'Ralph Edwards',
      email: 'ralph.edwards@example.com',
      totalAds: 85,
      status: UserAccountStatus.active,
    ),
    AdminUser(
      id: '458',
      name: 'Courtney Henry',
      email: 'courtney.henry@example.com',
      totalAds: 24,
      status: UserAccountStatus.active,
    ),
    AdminUser(
      id: '459',
      name: 'Marvin McKinney',
      email: 'marvin.mckinney@example.com',
      totalAds: 6,
      status: UserAccountStatus.active,
    ),
    AdminUser(
      id: '460',
      name: 'Brooklyn Simmons',
      email: 'brooklyn.simmons@example.com',
      totalAds: 41,
      status: UserAccountStatus.active,
    ),
    AdminUser(
      id: '461',
      name: 'Leslie Alexander',
      email: 'leslie.alexander@example.com',
      totalAds: 3,
      status: UserAccountStatus.blocked,
    ),
    AdminUser(
      id: '462',
      name: 'Jenny Wilson',
      email: 'jenny.wilson@example.com',
      totalAds: 19,
      status: UserAccountStatus.blocked,
    ),
    AdminUser(
      id: '463',
      name: 'Robert Fox',
      email: 'robert.fox@example.com',
      totalAds: 52,
      status: UserAccountStatus.active,
    ),
    AdminUser(
      id: '464',
      name: 'Cameron Williamson',
      email: 'cameron.williamson@example.com',
      totalAds: 8,
      status: UserAccountStatus.active,
    ),
    AdminUser(
      id: '465',
      name: 'Esther Howard',
      email: 'esther.howard@example.com',
      totalAds: 33,
      status: UserAccountStatus.active,
    ),
  ];
}
