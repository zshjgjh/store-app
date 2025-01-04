import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store/screens/add_product_page.dart';
import 'package:store/screens/home_page.dart';
import 'package:store/screens/update_product_page.dart';
import 'package:store/services/update_product_service.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id : (context) => HomePage(),
        UpdateProductPage.id: (context) => UpdateProductPage(),
        AddProductPage.id : (context) =>AddProductPage()
        
      },
      initialRoute: HomePage.id,
    );
  }
}
