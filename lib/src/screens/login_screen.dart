import 'package:ff_test/src/bloc/login_bloc.dart';
import 'package:ff_test/src/mixins/validation_mixins.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'navbar_screen.dart';

class LoginScreen extends StatefulWidget with Validator {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordvisible;

  void initState() {
    _passwordvisible = true;
    super.initState();
  }

  Widget build(context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: _height,
          minWidth: _width,
        ),
        child: IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFFE74249),
                  Color(0xFFBB4E75),
                ],
                stops: [0.1,0.9]
              )
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                welcomeText(),
                // Container(margin: EdgeInsets.only(top: 30.0)),
                loginField(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget welcomeText() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, top: 50.0),
      alignment: Alignment.topLeft,
      child: Text(
        'Login',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget loginField(context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;

    return Expanded(
      child: Center(
        child: Container(
          margin: EdgeInsets.only(bottom: _height * 0.15),
          alignment: Alignment.center,
          height: _height * 0.5,
          width: _width * 0.85,
          padding: EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50), topLeft: Radius.circular(50)),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(margin: EdgeInsets.only(top: 10.0)),
                nickNameField(),
                Container(margin: EdgeInsets.only(top: 25.0)),
                passwordField(),
                Container(margin: EdgeInsets.only(top: 50.0)),
                loginButton(),
                Container(margin: EdgeInsets.only(top: 30.0)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Регистрируясь вы принимаете наши условия:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                        )),
                    Container(margin: EdgeInsets.only(top: 10.0)),
                    Text('политику использования данных',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 12.0,
                            decoration: TextDecoration.underline)),
                    Text('политику в отношении файлов cookie',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 12.0,
                            decoration: TextDecoration.underline)),
                    Container(margin: EdgeInsets.only(top: 10.0)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget nickNameField() {
    return StreamBuilder<Object>(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: bloc.changeNickname,
            decoration: InputDecoration(
              labelText: 'Nickname',
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget passwordField() {
    return StreamBuilder<Object>(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            obscureText: _passwordvisible,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Input your Password',
              suffixIcon: IconButton(
                  icon: Icon(_passwordvisible
                      ? Icons.lock_outlined
                      : Icons.lock_open_outlined),
                  color: Colors.black54,
                  onPressed: () {
                    setState(() {
                      _passwordvisible = !_passwordvisible;
                    });
                  }),
              errorText: snapshot.error,
            ),
          );
        });
  }

  Widget loginButton() {
    return StreamBuilder<Object>(
        stream: bloc.submitValid,
        builder: (context, snapshot) {
          return Container(
            width: double.infinity,
            height: 50,
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFFE74249),
                      Color(0xFFD55482),
                    ],
                    stops: [0.1,0.7]
                )
            ),
            child: ElevatedButton(
                child: Text('Sign in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    )),
                onPressed: snapshot.hasData
                    ? () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NavBarScreen()))
                    : null,
                ),
          );
        });
  }
}
