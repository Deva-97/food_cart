import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/cart_viewmodel.dart';
import '../view_models/product_viewmodel.dart';
import '../widgets/product_item.dart';
import '../widgets/cart_summary.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final productVM = context.watch<ProductViewModel>();
    final cartVM = context.watch<CartViewModel>();

    return DefaultTabController(
      length: productVM.categories.length,
      child: Scaffold(
        body: Column(
          children: [
            // ─── HEADER ─────────────────────────────────────────────
            Stack(
              children: [
                Container(
                  width: 400,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage('assets/images/Burger plate.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Heart box.png',
                              width: 30,
                              height: 30,
                            ),
                            IconButton(
                              icon: const Icon(Icons.chevron_left,),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const Spacer(),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Heart box.png',
                              width: 30,
                              height: 30,
                            ),
                            IconButton(
                              icon: const Icon(Icons.search,size: 18,),
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/search'),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Heart box.png',
                              width: 30,
                              height: 30,
                            ),
                            IconButton(
                              icon: const Icon(Icons.share, size: 18,),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // ─── RESTAURANT INFO ────────────────────────────────────
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Amerika Foods',
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      const Text('American, Fast Food, Burgers',
                          style: TextStyle(color: Colors.grey)),
                      const SizedBox(width: 120,),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Heart box.png',
                            width: 48,
                            height: 48,
                          ),
                          Image.asset(
                            'assets/images/Heart.png',
                            width: 24,
                            height: 24,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      SizedBox(width: 4),
                      Text('4.5',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 12),
                      Icon(Icons.chat_bubble_outline, size: 20),
                      SizedBox(width: 4),
                      Text('1K+ reviews',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 12),
                      Icon(Icons.access_time, size: 20),
                      SizedBox(width: 4),
                      Text('15 mins',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),

            // ─── CATEGORIES ─────────────────────────────────────────
            TabBar(
              isScrollable: true,
              indicatorColor: Colors.green,
              labelColor: Colors.green,
              unselectedLabelColor: Colors.black87,
              tabs: [
                for (final cat in productVM.categories) Tab(text: cat),
              ],
            ),

            // ─── PRODUCTS ───────────────────────────────────────────
            Expanded(
              child: TabBarView(
                children: [
                  for (final cat in productVM.categories)
                    Builder(builder: (ctx) {
                      final items = productVM.getProductsByCategory(cat);
                      return items.isEmpty
                          ? const Center(child: Text('No items found'))
                          : ListView.builder(
                        padding:
                        const EdgeInsets.symmetric(vertical: 8),
                        itemCount: items.length,
                        itemBuilder: (_, i) =>
                            ProductItem(product: items[i]),
                      );
                    }),
                ],
              ),
            ),
          ],
        ),

        // ─── CART SUMMARY ────────────────────────────────────────
        bottomNavigationBar:
        cartVM.hasItems ? const CartSummary() : const SizedBox.shrink(),
      ),
    );
  }
}
