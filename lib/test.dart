import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("title")),
      body: const Center(
        child: Text(
          'A drawer is an invisible side screen.',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Abhishek Mishra"),
              accountEmail: Text("abhishekm977@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text("A", style: TextStyle(fontSize: 40.0)),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                // دستور زیر باعث بسته شدن منوی کشویی می شود.
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.contacts),
              title: const Text("Contact Us"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
