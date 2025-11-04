import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String user = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'نام کاربری',
                  hintText: 'نام خود را وارد کنید',
                  filled: true,
                  fillColor: const Color.fromARGB(33, 54, 171, 229),
                ),
                onChanged: (value) {
                  user = value;
                  print(user);
                },
              ),
              SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'رمز عبور',
                  hintText: 'رمز را وارد کنید',
                ),
                onChanged: (value) {
                  password = value;
                  print(password);
                },
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (user == 'ali' && password == '123456') {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('welcome messanger'),
                          content: const Text('welcome'),
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
                },
                child: Text("login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
