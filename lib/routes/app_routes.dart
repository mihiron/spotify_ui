import 'package:flutter/material.dart';
import 'package:spotify_ui/views/home_page.dart';
import 'package:spotify_ui/views/player_page.dart';

class AppRoutes {
  static const home = '/';
  static const player = '/player';
}

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return _buildRoute(const MyHomePage());

      case AppRoutes.player:
        return _buildRoute(const PlayerPage(), settings: settings);

      default:
        return null;
    }
  }

  static Route<dynamic>? _buildRoute(
    Widget child, {
    RouteSettings? settings,
    bool fullscreenDialog = false,
  }) {
    return MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => child,
      settings: settings,
      fullscreenDialog: fullscreenDialog,
    );
  }
}
