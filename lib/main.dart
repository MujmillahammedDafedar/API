import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:taskbyposs/service/api_service.dart';
import 'package:taskbyposs/ui/route.dart';
import 'package:taskbyposs/utils/constant/colors.dart';
import 'package:taskbyposs/utils/constant/route_path.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runZonedGuarded(() {
    runApp(MyApp());
  }, (error, stackTrace) {
    print('runZonedGuarded: Caught error in my root zone.');
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => ChangeNotifierProvider(
        create: (context) => ApiService(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Poss Task',
          //     navigatorObservers: [
          //     locator<AnalyticsService>().getAnalyticsObserver(),
          // ],
          theme: ThemeData(
            //   primarySwatch: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            appBarTheme: AppBarTheme(color: BackGrondColor, elevation: 0),
            scaffoldBackgroundColor: BackGrondColor,
          ),
          initialRoute: RoutePaths.Home,
          onGenerateRoute: Routers.generateRoute,
        ),
      ),
    );
  }
}
