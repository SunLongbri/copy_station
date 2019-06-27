import 'package:copy_station/provider/address_provider.dart';
import 'package:copy_station/provider/city_provider.dart';
import 'package:copy_station/provider/search_provider.dart';
import 'package:copy_station/provider/tab_provider.dart';
import 'package:copy_station/routers/application.dart';
import 'package:copy_station/routers/routes.dart';
import 'package:copy_station/splashpage/intro_view.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:provider/provider.dart';

import 'provider/type_provider.dart';

void main() {
  runApp(MyApp());
//  debugPaintSizeEnabled=true;
  FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            builder: (context) => CityProvider()),
        ChangeNotifierProvider(
            builder: (context) => SearchProvider()),
        ChangeNotifierProvider(
            builder: (context) => TabProvider()),
        ChangeNotifierProvider(
            builder: (context) => AddressProvider()),
        ChangeNotifierProvider(
            builder: (context) => TypeProvider()),
//        Provider<AddressProvider>.value(value: AddressProvider()),
//        Provider<ThemeDataBloc>.value(value: ThemeDataBloc()),
      ],
      child: MaterialApp(
        title: '邦德乐思',
        onGenerateRoute: Application.router.generator,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: IntroView(),
      ),
    );
  }
}
