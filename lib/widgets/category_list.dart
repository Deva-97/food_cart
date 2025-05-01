import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/product_viewmodel.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProductViewModel>();
    final cats = vm.categories;
    final selected = vm.selectedCategory;

    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: cats.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final cat = cats[i];
          final isSelected = cat == selected;
          return GestureDetector(
            onTap: () => vm.selectCategory(cat),
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.green : Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                cat,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight:
                  isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
