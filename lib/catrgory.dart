import 'package:flutter/material.dart';
import 'package:flutter_application_1/products_details.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class Category extends StatefulWidget {
  // const Category({super.key});
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<dynamic>? _categories = [];

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return _categories!.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: Center(child: Container(child: const Text(' دسته ها'))),
            ),
            body: Center(
              child: Container(
                color: Colors.blue[100],
                child: ListView.builder(
                  itemCount: _categories!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductsPage(
                                categoryName: _categories![index],
                              ),
                            ),
                          );
                        },
                        child: Text(_categories![index]),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
  }

  Future<void> getCategories() async {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/categories'))
        .timeout(
          const Duration(minutes: 1),
          onTimeout: () {
            return http.Response('Http error', 400);
          },
        );

    if (response.statusCode == 200) {
      //  final responseBody = utf8.decode(response.bodyBytes);
      final parsed = json.decode(response.body);
      print(parsed);

      setState(() {
        _categories = parsed;
      });
    } else {
      print('sdf df sdfs dgsaklswdnfsvndl');
    }
  }
}
