import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/cart_viewmodel.dart';

class CartView extends StatelessWidget {
  static const routeName = '/cart';
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartVM = context.watch<CartViewModel>();
    final items = cartVM.items.entries.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: items.isEmpty
          ? const Center(child: Text('Cart is empty'))
          : ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, i) {
          final prod = items[i].key;
          final qty = items[i].value;
          return ListTile(
            leading: Image.asset(prod.imageUrl, width: 60, height: 60),
            title: Text(prod.name),
            subtitle: Text('Qty: $qty'),
            trailing: Text('₹${(prod.price * qty).toStringAsFixed(2)}'),
          );
        },
      ),
      bottomNavigationBar: items.isNotEmpty
          ? Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'Total: ₹${cartVM.totalPrice.toStringAsFixed(2)}',
          style:
          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      )
          : null,
    );
  }
}
