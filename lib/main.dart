import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyxp_mobile/view/sweetLoad/splashLoad.dart';

import 'design/design.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            darkTheme: ControleDeCor.darkTheme,
            theme: ControleDeCor.lightTheme,
            home: SplashLoad(), // IntroducaoAnimada
          );
        },
      );
}
