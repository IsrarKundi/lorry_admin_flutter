abstract final class AppTexts {
  AppTexts._();

  static const String appTitle = 'Lorry Adda — Admin';

  static const String navOverview = 'Overview';
  static const String navUsers = 'Users';
  static const String navAdsManagement = 'Ads Management';
  static const String navPushNotifications = 'Push Notifications';
  static const String navBlogNewsFeed = 'Blog & News Feed';
  static const String navInspections = 'Inspection';

  // Dashboard
  static const String dashboardOverviewTitle = 'Overview';
  static const String dashboardUserSignups = 'User Signups';
  static const String dashboardTotalAdsToday = 'Total Ads Today';
  static const String dashboardMonthly = 'Monthly';
  static const String dashboardTotalAdsLabel = 'Total Ads';
  static const String dashboardUsedTruck = 'Used Truck';
  static const String dashboardNewTruck = 'New Truck';
  static const String dashboardBodyParts = 'Body Parts';
  static const String searchHint = 'Search';

  // Users
  static const String usersPageTitle = 'Users';
  static const String usersFilterActive = 'Active';
  static const String usersFilterBlock = 'Block';
  static const String usersColUserId = 'User ID';
  static const String usersColName = 'Name';
  static const String usersColEmail = 'Email';
  static const String usersColTotalAds = 'Total Ads';
  static const String usersColStatus = 'Status';
  static const String usersStatusActive = 'Active';
  static const String usersStatusBlocked = 'Blocked';

  // Ads management
  static const String adsPageTitle = 'Ad Management';
  static const String adsFilterAds = 'Ads';
  static const String adsFilterReports = 'Reports';
  static const String adsViewAll = 'View All';
  static const String adsSectionNewTruck = 'New Truck';
  static const String adsSectionUsedTruck = 'Used Truck';
  static const String adsSectionBodyParts = 'Body Parts';

  // Push notifications
  static const String notificationsPageTitle = 'Push Notifications';
  static const String notificationsSendNew = '+ Send New';
  static const String notificationsColDateTime = 'Date & Time';
  static const String notificationsColTitle = 'Title';
  static const String notificationsColBody = 'Notification';
  static const String notificationsDialogTitle = 'Push Notifications';
  static const String notificationsFieldTitle = 'Title';
  static const String notificationsFieldBody = 'Notification';
  static const String notificationsCancel = 'Cancel';
  static const String notificationsSend = 'Send';
  static const String notificationsSentSuccess = 'Notification sent successfully.';

  // Blog & news feed
  static const String blogPageTitle = 'Blog & News Feed';
  static const String blogAddNew = '+ Add New';
  static const String blogColTitle = 'Title';
  static const String blogColPublished = 'Published';
  static const String blogColAuthor = 'Author';
  static const String blogCreateTitle = 'Create Blog';
  static const String blogEditTitle = 'Edit Blog';
  static const String blogDetailTitle = 'Blog Detail';
  static const String blogFieldTitle = 'Title';
  static const String blogFieldExcerpt = 'Excerpt';
  static const String blogFieldContent = 'Content';
  static const String blogFieldAuthor = 'Author';
  static const String blogPublish = 'Publish';
  static const String blogSave = 'Save';
  static const String blogCancel = 'Cancel';
  static const String blogBack = 'Back';
  static const String blogPublishedSuccess = 'Blog published successfully.';
  static const String blogReadMore = 'Read more';

  // Inspections
  static const String inspectionsPageTitle = 'Inspection';
  static const String inspectionsFilterNewRequest = 'New Request';
  static const String inspectionsFilterAssigned = 'Assigned';
  static const String inspectionsDetailTitle = 'Inspection Detail';
  static const String inspectionsRequestId = 'Request ID';
  static const String inspectionsVehicle = 'Vehicle';
  static const String inspectionsLocation = 'Location';
  static const String inspectionsStatus = 'Status';
  static const String inspectionsRequestedOn = 'Requested on';
  static const String inspectionsOwner = 'Owner';
  static const String inspectionsPhone = 'Phone';
  static const String inspectionsInspector = 'Inspector';
  static const String inspectionsScheduled = 'Scheduled';
  static const String inspectionsNotes = 'Notes';
  static const String inspectionsStatusNew = 'New Request';
  static const String inspectionsStatusAssigned = 'Assigned';
  static const String inspectionsNotScheduled = 'Not scheduled yet';

  static const String menuComingSoon = 'Coming soon.';

  // Auth — login
  static const String loginWelcomeTitle = 'Welcome to, Lorry';
  static const String loginWelcomeSubtitle = 'Enter your lorry account to continue.';
  static const String loginEmailLabel = 'Email address';
  static const String loginEmailHint = 'Your email address';
  static const String loginPasswordLabel = 'Password';
  static const String loginPasswordHint = 'Your password';
  static const String loginForgotPassword = 'Forgot password?';
  static const String loginButton = 'Login';

  // Auth — forgot password modals
  static const String forgotResetTitle = 'Reset Your Password';
  static const String forgotResetSubtitle =
      "Enter your email and we'll send you a link to reset your password.";
  static const String forgotCodeTitle = 'Enter the code';
  static String forgotCodeSubtitle(String email) =>
      'We have just sent you a 4-digit code to $email';
  static const String forgotNewPasswordTitle = 'Create a new password';
  static const String forgotNewPasswordSubtitle =
      'Your new password must be different from previous used passwords.';
  static const String forgotPasswordLabel = 'Password';
  static const String forgotPasswordHint = 'Enter your password';
  static const String forgotConfirmPasswordLabel = 'Confirm Password';
  static const String forgotConfirmPasswordHint = 'Confirm your password';
  static const String forgotNext = 'Next';
}
