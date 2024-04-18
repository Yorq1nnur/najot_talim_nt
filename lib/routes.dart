enum Routes {
  splash,
  about,
  game,
  setting
}

class Paths {
  static const String splash = '/';
  static const String about = '/about';
  static const String game = '/game';
  static const String setting = '/setting';

  static const Map<Routes, String> _pathMap = {
    Routes.splash: Paths.splash,
    Routes.about: Paths.about,
    Routes.game: Paths.game,
    Routes.setting: Paths.setting
  };

  static String of(Routes route) => _pathMap[route] ?? splash;

}

