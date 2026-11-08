import '../../models/admin_nav_item.dart';
import '../../utils/app_nav_assets.dart';
import '../../utils/app_texts.dart';

abstract final class AdminNavConfig {
  AdminNavConfig._();

  static const List<AdminNavItem> items = [
    AdminNavItem(
      label: AppTexts.navOverview,
      iconAsset: AppNavAssets.overview,
      path: '/dashboard',
    ),
    AdminNavItem(
      label: AppTexts.navUsers,
      iconAsset: AppNavAssets.users,
      path: '/users',
    ),
    AdminNavItem(
      label: AppTexts.navAdsManagement,
      iconAsset: AppNavAssets.adsManagement,
      path: '/ads',
    ),
    AdminNavItem(
      label: AppTexts.navPushNotifications,
      iconAsset: AppNavAssets.pushNotifications,
      path: '/notifications',
    ),
    AdminNavItem(
      label: AppTexts.navBlogNewsFeed,
      iconAsset: AppNavAssets.blogNewsFeed,
      path: '/news-feed',
    ),
    AdminNavItem(
      label: AppTexts.navInspections,
      iconAsset: AppNavAssets.inspection,
      path: '/inspections',
    ),
  ];
}
