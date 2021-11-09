class AppConfig {
  /// The app name
  final String appName;

  /// Base http host for all requests with backend
  final String host;

  /// Whether the dev debug flag should be shown
  final bool showDebugFlag;

  final String xClientName;

  final String xRapidKey;

  /// Constructs an instance of the config
  AppConfig({
    this.showDebugFlag = false,
  })
      : appName = _DevConstants.appName,
        host = _DevConstants.host,
        xClientName = _DevConstants.xClientName,
        xRapidKey = _DevConstants.xRapidKey;

}

class _DevConstants {
  static const appName = 'Songs Lyrics List';
  static const host = 'https://genius.p.rapidapi.com';
  static const xClientName = 'crosschannelapp';
  static const xRapidKey = 'BhQafsu6a4mshfsvTrCgAMdrEG2yp13hb9sjsnlt2WQv0SrwO5';
}


