import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studyxp_mobile/design/design.dart';
import 'package:studyxp_mobile/view/welcome/introducao.dart';

class TelaPrincipalConfig extends StatefulWidget {
  const TelaPrincipalConfig({Key? key}) : super(key: key);

  @override
  _TelaPrincipalConfigState createState() => _TelaPrincipalConfigState();
}

class _TelaPrincipalConfigState extends State<TelaPrincipalConfig> {
  getUserAccess() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IntroducaoAnimada(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 56,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              ClipOval(
                child: Image.asset(
                  'lib/design/images/Logo_StudyXP.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.wb_sunny_outlined,
                    size: 50,
                    color: ControleDeCor.lightTheme.primaryColor,
                  ),
                  title: Text(
                    'Alterar Tema',
                    style: TextStyle(
                      color: ControleDeCor.lightTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('Altere para modo Noturno ou Diurno'),
                  onTap: () {
                    final provider =
                        Provider.of<ThemeProvider>(context, listen: false);
                    provider.toggleTheme(provider.isDarkMode);
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    getUserAccess();
                  },
                  leading: Icon(
                    Icons.logout_outlined,
                    size: 50,
                    color: ControleDeCor.lightTheme.primaryColor,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: ControleDeCor.lightTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('sair da conta ou alternar usuários'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
