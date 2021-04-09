import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hcr/Constants/global.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10, 20.0, 10),
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
                          prefixIcon: Icon(Icons.email),
                          enabledBorder: OutlineInputBorder(
                              gapPadding: 10,
                              borderRadius: BorderRadius.circular(30)),
                          errorBorder: OutlineInputBorder(
                              gapPadding: 10,
                              borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                              gapPadding: 10,
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10, 20.0, 10),
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
                          labelText: "Password",
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          enabledBorder: OutlineInputBorder(
                              gapPadding: 15,
                              borderRadius: BorderRadius.circular(30)),
                          errorBorder: OutlineInputBorder(
                              gapPadding: 10,
                              borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                              gapPadding: 10,
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            color: redish,
                            fontSize: 25,
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
