import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/product_viewmodel.dart';

class AppSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  const AppSearchBar({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<ProductViewModel>();
    final ctrl = controller ?? TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: TextField(
        controller: ctrl,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.mic),
            onPressed: () {/* your mic action */},
          ),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: vm.updateSearch,
      ),
    );
  }
}
