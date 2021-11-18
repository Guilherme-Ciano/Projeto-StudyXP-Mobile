import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:studyxp_mobile/design/design.dart';
import 'package:studyxp_mobile/model/alunoModel.dart';
import 'package:studyxp_mobile/services/loginService.dart';
import 'package:studyxp_mobile/view/home/homepage.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({
    Key? key,
  }) : super(key: key);

  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  @override
  Widget build(BuildContext context) {
    final _loginFormKey = GlobalKey<FormState>();

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final String email = emailController.text;
    final String password = passwordController.text;

    FocusNode myFocusNode = new FocusNode();

    List<Aluno> aluno = [];

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 350, maxHeight: 350),
              child: Image.asset(
                'lib/design/images/Logo_StudyXP.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Form(
            key: _loginFormKey,
            child: Container(
              margin: EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: TextFormField(
                      controller: emailController,
                      validator: (email) {
                        if (email == "" || email == null) {
                          return 'Por favor, insira um valor';
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Digite seu Email',
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: ControleDeCor.Tema,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Card(
                    child: TextFormField(
                      focusNode: myFocusNode,
                      controller: passwordController,
                      validator: (password) {
                        if (password == "" || password == null) {
                          return 'Por favor, insira um valor';
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Digite sua Senha',
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: ControleDeCor.Tema,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 4,
                      right: 4,
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        print('log');
                        await login(
                          emailController.text,
                          passwordController.text,
                          context,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: ControleDeCor.Tema,
                      ),
                      child: Row(
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(18),
                              child: Text(
                                "Entrar",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
