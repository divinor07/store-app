import 'package:flutter/material.dart';
import 'package:store_app/helpers/validators.dart';
import 'package:store_app/models/user.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/user_manager.dart';

class SignupScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final User user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Nome Completo'),
                  validator: (name) {
                    if (name.isEmpty) {
                      return 'Campo obrigatório!';
                    } else if (name.trim().split(' ').length <= 1) {
                      return 'Preencha seu Nome Completo!';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (name) => user.name = name,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email.isEmpty) {
                      return 'Campo obrigatório!';
                    } else if (!emailValid(email)) {
                      return 'E-mail inválido!';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (email) => user.email = email,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Senha'),
                  obscureText: true,
                  validator: (pass) {
                    if (pass.isEmpty) {
                      return 'Campo obrigatório!';
                    } else if (pass.length < 6) {
                      return 'Senha muito curta!';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (pass) => user.password = pass,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Repita a Senha'),
                  obscureText: true,
                  validator: (pass) {
                    if (pass.isEmpty) {
                      return 'Campo obrigatório!';
                    } else if (pass.length < 6) {
                      return 'Senha muito curta!';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (pass) => user.confirmPassword = pass,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    disabledColor:
                        Theme.of(context).primaryColor.withAlpha(100),
                    textColor: Colors.white,
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();

                        if (user.password != user.confirmPassword) {
                          scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: const Text('As Senhas não são Iguais!'),
                              backgroundColor: Colors.red,
                            ),
                          );

                          return;
                        } else {
                          context.read<UserManager>().signUp(
                                user: user,
                                onSuccess: () {
                                  debugPrint('Sucesso!');
                                  // TODO: POP
                                },
                                onFail: (e) {
                                  scaffoldKey.currentState.showSnackBar(
                                    SnackBar(
                                      content: Text('Falha ao cadastrar: $e'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                },
                              );
                        }
                      }
                    },
                    child: const Text(
                      'Criar Conta',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
