import 'package:flutter/material.dart';

/// Design tokens — logistics / brand palette (shared with mobile).
abstract final class AppColors {
  AppColors._();

  static const Color primary = Color(0xFFEC3237);
  static const Color textPrimary = Color(0xFF1E1E1E);
  static const Color textBold = Color(0xFF1B1B1B);
  static const Color textHint = Color(0xFF7D7D7D);
  static const Color textDarkGrey = Color(0xFF919191);

  /// Top app bar / sidebar header.
  static const Color appBarBackground = Color(0xFF912023);

  /// Deep red header behind tabs.
  static const Color homeHeaderBackground = Color(0xFF901C1C);

  /// Active filter / pill highlight.
  static const Color homeFilterActive = Color(0xFFE53935);

  /// Page background behind cards (Figma main area).
  static const Color homeScaffoldBackground = Color(0xFFF5F5F5);

  /// Sidebar surface.
  static const Color sidebarBackground = Color(0xFFFFFFFF);

  /// Muted tile background (sell sheet style).
  static const Color sellOptionTileBackground = Color(0xFFF0F0F0);

  /// Success snackbar / positive feedback backgrounds.
  static const Color snackbarSuccess = Color(0xFF2E7D32);

  /// Auth — input borders and dividers.
  static const Color authInputBorder = Color(0xFFE0E0E0);
  static const Color authDivider = Color(0xFFE8E8E8);

  /// Sidebar — active nav pill (Figma light pink).
  static const Color navActiveBackground = Color(0xFFFFEAEA);

  /// Link-style title in notifications table.
  static const Color linkBlue = Color(0xFF2F80ED);

  /// Modal / send action maroon (Figma push notification dialog).
  static const Color modalTitleMaroon = Color(0xFF8B1D22);

  /// Users table (Figma).
  static const Color tableHeaderBackground = Color(0xFFFFEAEA);
  static const Color tableRowAlternate = Color(0xFFFAFAFA);
  static const Color usersBlockButton = Color(0xFF9E9E9E);

  /// Charts.
  static const Color chartBarInactive = Color(0xFFE5E5E5);
  static const Color chartDonutLight = Color(0xFFF5B4B4);
  static const Color chartDonutDark = Color(0xFF8B1D22);
  static const Color chartTooltipBackground = Color(0xFF2D2D2D);
}
