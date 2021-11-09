class AppConfig {
  /// The app name
  final String appName;

  /// Base http host for all requests with backend
  final String host;

  /// Whether the dev debug flag should be shown
  final bool showDebugFlag;

  final String xClientName;

  /// Constructs an instance of the config
  AppConfig({
    this.showDebugFlag = false,
  })  : appName = _DevConstants.appName,
        host = _DevConstants.host,
        xClientName = _DevConstants.xClientName;
}

class _DevConstants {
  static const appName = 'Songs Lyrics List';
  static const host = 'https://genius.p.rapidapi.com';
  static const xClientName = 'crosschannelapp';
  static const headers = {
    'x-rapidapi-host': 'genius.p.rapidapi.com',
    'x-rapidapi-key': 'BhQafsu6a4mshfsvTrCgAMdrEG2yp13hb9sjs'
  };
}
