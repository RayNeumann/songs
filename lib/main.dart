import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:songs/common/config/app_config.dart';
import 'package:songs/pages/songs_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final AppConfig _appConfig = AppConfig();
  static List<SingleChildWidget>? appProvidersSingleton;

  @override
  Widget build(BuildContext context) {
    _getAppProvidersSingleton();
    return MaterialApp(
      title: _appConfig.appName,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: _appConfig.showDebugFlag,
      /* home: MultiProvider(
        providers: appProvidersSingleton!,
        child: SongsListPage(),
      ),*/
      home: SongsListPage(),
    );
  }

  static void _getAppProvidersSingleton() {
    /*  final WebService webService = WebService(_appConfig);
    appProvidersSingleton = [
      Provider<WebService>.value(value: webService),
      ChangeNotifierProvider(create: (context) => MerchantListViewModel(webService)),
    ];*/
  }
}
