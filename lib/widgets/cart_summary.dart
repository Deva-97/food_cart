import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/cart_viewmodel.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final cartVM = context.watch<CartViewModel>();
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/cart'),
      child: Container(
        height: 60,
        color: Colors.green,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${cartVM.totalItems} item(s)',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              '₹${cartVM.totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () => Navigator.pushNamed(context, '/cart'),
              child: const Text('View cart'),
            ),
          ],
        ),
      ),
    );
  }
}
