import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:projeto_muh_compmov/screens/CadastroFzd.dart';
import 'package:projeto_muh_compmov/screens/TelaPrincipalEntrada.dart';
import 'package:projeto_muh_compmov/screens/fazendas_screen.dart';
import 'package:projeto_muh_compmov/screens/item_registration_screen.dart';
import 'package:projeto_muh_compmov/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';
class LoginScreen extends StatefulWidget {
@override
_LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  List name;

  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body:ScopedModelDescendant<UserModel>(
        builder: (context,child,model){
          if(model.isLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(6.0),
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child:  Image.asset(
                        'assets/vakinha.png'
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Muh',
                      style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'E-mail',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  TextFormField(
                    controller: _emailController,
                      validator: (text){
                        if(text.isEmpty || !text.contains("@")) return 'Email invalido';
                      },
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(20.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.grey[800]),
                          hintText: "E-mail",
                          fillColor: Colors.white70
                      )
                  ),
                  SizedBox(height: 10.0,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Senha',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  TextFormField(
                      obscureText: true,
                      validator: (text){
                        if(text.isEmpty|| text.length < 4) return 'Senha inválida!';
                      },
                      controller: _passController,
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(20.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.grey[800]),
                          hintText: "Senha",
                          fillColor: Colors.white70
                      )
                  ),
                  SizedBox(height: 8.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: FlatButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUpScreen()));
                          },
                          child: Text(
                            'Cadastrar',
                            style: TextStyle(
                                fontSize: 16.0
                            ),
                            textAlign: TextAlign.left,),
                          padding:EdgeInsets.zero,

                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: (){
                            if(_emailController.text.isEmpty){
                              _scaffoldKey.currentState.showSnackBar(
                                SnackBar(content: Text("Insira seu email para redefinir a senha"),
                                  backgroundColor: Colors.redAccent,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }else{
                              model.recoverPass(_emailController.text);
                              _scaffoldKey.currentState.showSnackBar(
                                SnackBar(content: Text("Confira seu email"),
                                  backgroundColor: Theme.of(context).primaryColor,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          child: Text('Esqueci minha senha',
                            style: TextStyle(
                              fontSize: 16.0
                            ),
                            textAlign: TextAlign.right,),
                          padding:EdgeInsets.zero,
                        ),
                      ),


                    ],
                  ),
                  SizedBox(height: 10.0,),
              ButtonTheme(
                minWidth: 80.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.black)
                  ),
                  child: Text(
                    'Entrar',
                    style: TextStyle(
                        fontSize: 25.0
                    ),
                  ),
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      model.SignOut();
                      model.pegaNomedeumaFazenda();
                      this.name = model.nome;
                      model.signIn(
                          email: _emailController.text,
                          pass: _passController.text,
                          onSuccess: _onSuccess,
                          onFail: _onFail
                      );
                    }
                  },
                ),
              ),
                  SizedBox(height: 16.0,),
                  Align(
                    alignment: Alignment.center,
                    child: FlatButton(
                      onPressed: (){
                        //para qual tela esta vai?
                      },
                      child: Text(
                        'Entrar como visitante',
                        style: TextStyle(
                            fontSize: 16.0
                        ),
                        textAlign: TextAlign.left,),
                      padding:EdgeInsets.zero,

                    ),
                  ),


              ],
              ),
            );
          }
        },
      )
    );
  }

  void _onSuccess(){
    Navigator.of(context).push(
//        MaterialPageRoute(builder: (context)=>ItemRegister('AX9hCVmkDEHHsTtgFzl3')
         MaterialPageRoute(builder: (context) => TelaPrincipal(this.name))
    );
  }
  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text("Falha ao Entrar"),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      ),
    );
  }

}