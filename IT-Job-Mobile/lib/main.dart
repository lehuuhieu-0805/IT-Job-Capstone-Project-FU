import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:it_job_mobile/utils/app_them.dart';
import 'package:it_job_mobile/view/profile/user_preferences.dart';
import 'package:sizer/sizer.dart';

import 'config/routes/route_generator.dart';
import 'constants/route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );
  await UserPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: ((context, orientation, deviceType) {
        return MaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('vi', 'VN'),
          ],
          debugShowCheckedModeBanner: false,
          initialRoute: RoutePath.bottomTabBarRouter,
          theme: getConfigTheme(),
          onGenerateRoute: RouteGenerator.getRoute,
        );
      }),
    );
  }
}
