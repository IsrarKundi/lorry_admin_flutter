enum UserAccountStatus { active, blocked }

class AdminUser {
  const AdminUser({
    required this.id,
    required this.name,
    required this.email,
    required this.totalAds,
    required this.status,
  });

  final String id;
  final String name;
  final String email;
  final int totalAds;
  final UserAccountStatus status;
}
