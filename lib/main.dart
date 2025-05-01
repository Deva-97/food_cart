import 'package:flutter/material.dart';
import 'package:food_cart/view_models/cart_viewmodel.dart';
import 'package:food_cart/view_models/product_viewmodel.dart';
import 'package:provider/provider.dart';
import 'views/home_view.dart';
import 'views/search_view.dart';
import 'views/cart_view.dart';

void main() {
  runApp(const FoodOrderingApp());
}

class FoodOrderingApp extends StatelessWidget {
  const FoodOrderingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductViewModel()),
        ChangeNotifierProvider(create: (_) => CartViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Ordering App',
        theme: ThemeData(
          primaryColor: Colors.white,
          fontFamily: 'Futura Std',
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Futura Std',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const HomeView(),
          '/search': (_) => const SearchView(),
          '/cart': (_) => const CartView(),
        },
      ),
    );
  }
}
