import 'package:flutter/material.dart';
import 'package:flutter_application_1/catrgory.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  String user = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(10),
            width: 400,
            height: 300,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 213, 225, 232),
              border: Border.all(color: Colors.cyanAccent),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your full name',
                    labelText: 'Name',
                  ),
                  onChanged: (value) {
                    user = value;
                    print(user);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.lock),
                    hintText: 'Enter a password',
                    labelText: 'PASS',
                  ),
                  onChanged: (value) {
                    password = value;
                    print(password);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter valid phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (user == 'ali' && password == '123456') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => Category(),
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('warning'),
                              content: const Text('password or user is wrong'),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                      // If the form is valid, display a Snackbar.
                      // ویجت Snackbar از پایین صفحه به صورت کشویی بالا می آید و پیامی برای چند ثانیه نمایش می دهد
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Data is in processing.')),
                      );
                    }
                  },
                  child: Text("login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
