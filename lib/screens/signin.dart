import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hcr/constants/constants.dart';
import 'package:hcr/constants/global.dart';
import 'package:hcr/utils/loader.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formkey = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final url = 'http://10.0.2.2:8000/api/login';
  var token;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/img.svg',
                    height: MediaQuery.of(context).size.height * .3,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Login in with your email\n         and password',
                    style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10, 20.0, 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white12,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.3),
                              // blurRadius: 20.1,
                            )
                          ],
                          borderRadius: BorderRadius.circular(30)),
                      child: TextFormField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!value.contains('@')) {
                            return 'Make sure you enter a proper email';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Email",
                            labelStyle: TextStyle(color: textColor),
                            prefixIcon: Icon(
                              Icons.email,
                              color: textColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              gapPadding: 10,
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                gapPadding: 10,
                                borderRadius: BorderRadius.circular(30)),
                            focusedBorder: OutlineInputBorder(
                                gapPadding: 10,
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10, 20.0, 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white12,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.3),
                              // blurRadius: 20.1,
                            )
                          ],
                          borderRadius: BorderRadius.circular(30)),
                      child: TextFormField(
                        controller: _password,
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            errorStyle: TextStyle(),
                            labelText: "Password",
                            hintText: "Password",
                            labelStyle: TextStyle(color: textColor),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: textColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                                // gapPadding: 15,
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30)),
                            errorBorder: OutlineInputBorder(
                                // gapPadding: 10,
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30)),
                            focusedBorder: OutlineInputBorder(
                              // gapPadding: 10,
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () async {
                        Dialogs.showLoadingDialog(
                            context, _keyLoader); //invoking login
                        try {
                          final email = _email.text.trim();
                          final password = _password.text.trim();
                          if (_formkey.currentState.validate()) {
                            token = await http.post(
                              '$url',
                              body: {"email": email, "password": password},
                            );
                            final jsonData = convert.jsonDecode(token.body);
                            if (jsonData['success']) {
                              Constants.prefs.setBool("isLoggedin", true);
                              Constants.prefs
                                  .setString("token", jsonData['token']);
                              Fluttertoast.showToast(
                                  msg: jsonData['msg'],
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: textColor,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              Navigator.pushReplacementNamed(context, '/home');
                            } else {
                              Fluttertoast.showToast(
                                  msg: jsonData['msg'],
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: textColor,
                                  textColor: redish,
                                  fontSize: 16.0);
                              Navigator.of(_keyLoader.currentContext,
                                      rootNavigator: true)
                                  .pop();
                            }
                          }
                        } catch (e) {
                          Navigator.of(_keyLoader.currentContext,
                                  rootNavigator: true)
                              .pop();
                          print(e);
                        }
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            color: redish,
                            fontSize: 25,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
