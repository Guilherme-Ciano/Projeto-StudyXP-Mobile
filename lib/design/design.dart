import 'package:flutter/material.dart';

class ControleDeCor {
  static final lightTheme = ThemeData(
    backgroundColor: Color(0xFFEDF0F2),
    scaffoldBackgroundColor: Color(0xFEFEFEFE),
    primaryColor: Color(0xFF3f51b5),
    colorScheme: ColorScheme.light(),
  );

  static final darkTheme = ThemeData(
    backgroundColor: Color(0xFF171717),
    scaffoldBackgroundColor: Color(0xFF242424),
    primaryColor: Color(0xFF3f51b5),
    accentColor: Color(0xFF5070B1),
    colorScheme: ColorScheme.dark(),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: TextButton.styleFrom(
        primary: Color(0xFF3f51b5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        alignment: Alignment.center,
        side: BorderSide(
          color: Color(0xFF3f51b5),
          width: 2,
        ),
      ),
    ),
  );

  // Cores
  static const Color Branco = Color(0xFFFFFFFF);
  static const Color Preto = Color(0xFF000000);
  static const Color InicioGradiente = Color(0xFF5070B1);
  static const Color FimGradiente = Color(0xFFAFF4D4);
  static const Color Tema = Color(0xFF3f51b5);
  static const Color TemaEscuro = Color(0xFF03256C);
  static const Color TemaContraste = Color(0xFFEF476F);
  static const Color Buttons = Color(0xFF71f79f);

  //textos
  static const Color Texto = Color(0xFF253840);
  static const Color TextoEscuro = Color(0xFF17262A);
  static const Color TextoClaro = Color(0xFF4A6572);
  static const Color TextoDesativado = Color(0xFF767676);
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    if (isOn == true) {
      isOn = false;
    } else {
      isOn = true;
    }
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
