import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyxp_mobile/design/design.dart';

class TelaPrincipalConfig extends StatefulWidget {
  const TelaPrincipalConfig({Key? key}) : super(key: key);

  @override
  _TelaPrincipalConfigState createState() => _TelaPrincipalConfigState();
}

class _TelaPrincipalConfigState extends State<TelaPrincipalConfig> {
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
                    //color: CoresDoApp.lightTheme.primaryColor,
                  ),
                  title: Text('Alterar Tema'),
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
                  onTap: () {},
                  leading: Icon(
                    Icons.room_service_outlined,
                    size: 50,
                    //color: CoresDoApp.lightTheme.primaryColor,
                  ),
                  title: Text('Adicionar Mesa'),
                  subtitle: Text('Adicione uma nova mesa ao sistema'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
