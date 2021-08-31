import 'package:flutter/material.dart';
import 'package:studyxp_mobile/design/design.dart';
import 'package:studyxp_mobile/model/alunoModel.dart';
import 'package:studyxp_mobile/view/tarefasPendentes.dart';

class MyHomePageAluno extends StatefulWidget {
  final Aluno aluno;
  MyHomePageAluno({Key? key, required this.aluno}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageAluno> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    List pags = [
      TarefasPendentes(),
    ];

    void a(int i) {
      pags[i];
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: Icon(
                  Icons.account_circle_outlined,
                  color: ControleDeCor.Preto,
                ),
                trailing: Text('Nível: ' + widget.aluno.level.toString()),
                subtitle: Text(widget.aluno.grade.toString() + '° Ano'),
                title: Text(
                  widget.aluno.nome,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                dense: true,
              ),
            ),
            Center(
              child: TarefasPendentes(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Pendentes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_outlined),
            label: 'Concluídas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Perfil',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ControleDeCor.Tema,
        onTap: a,
      ),
    );
  }
}
