import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:mchat_app/utils/func.dart';
import 'package:mchat_app/utils/style.dart';

import '../baseView.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  bool _hide = true;

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Stack(
        children: [
          Scaffold(
            key: _globalKey,
            appBar: AppBar(
              title: Text(
                'MChat',
                style: UtilStyle.titleAppBarText,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Spacer(flex: 1),
                  Center(
                    child: Text(
                      'Login Account',
                      style: UtilStyle.headerText,
                    ),
                  ),
                  Spacer(flex: 1),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _username,
                          cursorColor: Colors.blueGrey,
                          keyboardType: TextInputType.text,
                          validator: UtilFun.valueUsername,
                          decoration: InputDecoration(
                              prefixIcon: Icon(FontAwesomeIcons.userAlt,
                                  size: 20, color: Colors.blueGrey),
                              suffix: GestureDetector(
                                onTap: () =>
                                    setState(() => _username.text = ''),
                                child: Icon(Icons.backspace,
                                    color: Colors.blueGrey),
                              ),
                              hintText: 'Username',
                              hintStyle: UtilStyle.placeHolderText,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blueGrey)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blueGrey))),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _password,
                          cursorColor: Colors.blueGrey,
                          keyboardType: TextInputType.text,
                          obscureText: _hide,
                          validator: UtilFun.valuePassword,
                          decoration: InputDecoration(
                              prefixIcon: Icon(FontAwesomeIcons.key,
                                  size: 20, color: Colors.blueGrey),
                              suffix: GestureDetector(
                                onTap: () => setState(() {
                                  if (_hide)
                                    _hide = false;
                                  else
                                    _hide = true;
                                }),
                                child: Icon(
                                    _hide
                                        ? FontAwesomeIcons.eyeSlash
                                        : FontAwesomeIcons.eye,
                                    size: 20,
                                    color: Colors.blueGrey),
                              ),
                              hintText: 'Password',
                              hintStyle: UtilStyle.placeHolderText,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blueGrey)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blueGrey))),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text('Forgot Password?',
                              style: UtilStyle.blackBoldText))
                    ],
                  ),
                  Spacer(flex: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have account yet? ',
                        style: TextStyle(fontFamily: 'faktSoftNormal'),
                      ),
                      Text(
                        'Register',
                        style: TextStyle(
                            fontFamily: 'faktSoftBold',
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Spacer(flex: 2),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() => _loading = true);
                if (_formKey.currentState.validate()) {
                  if (_username.text != null && _password.text != null) {
                    if (_username.text == 'thong' &&
                        _password.text == '123456') {
                      Future.delayed(Duration(seconds: 2)).then((value) {
                        setState(() => _loading = false);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BaseViewPage()));
                      });
                    } else {
                      Future.delayed(Duration(seconds: 2)).then((value) {
                        setState(() => _loading = false);
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Alert'),
                              content: Text(
                                  'Your Username & Password is Incorrect!'),
                              actions: [
                                FlatButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('OK'))
                              ],
                            );
                          },
                        );
                      });
                    }
                  }
                } else {
                  setState(() => _loading = false);
                }
              },
              child: Icon(FontAwesomeIcons.arrowRight),
            ),
          ),
          _loading
              ? Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    color: Colors.blueGrey.withOpacity(0.1),
                    child: Center(
                      child: LoadingBouncingGrid.square(
                          backgroundColor: Colors.cyan, inverted: true),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
