import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/product_viewmodel.dart';
import '../widgets/product_item.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _ctrl = TextEditingController();
  String _query = '';
  final List<String> _suggestions = [
    'Burgers', 'Chicken', 'Fries', 'Beverages', 'Sides', 'Desserts'
  ];

  @override
  Widget build(BuildContext context) {
    final all = context.read<ProductViewModel>().allProducts;
    final results = _query.isEmpty
        ? <dynamic>[]
        : all
        .where((p) =>
        p.name.toLowerCase().contains(_query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          controller: _ctrl,
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(Icons.mic),
              onPressed: () {},
            ),
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding:
            const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (v) => setState(() => _query = v),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: _query.isEmpty
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Search recommendations',
                style: TextStyle(fontSize: 16)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final s in _suggestions)
                  ActionChip(
                    label: Text(s),
                    onPressed: () {
                      _ctrl.text = s;
                      setState(() => _query = s);
                    },
                  )
              ],
            ),
          ],
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${results.length} Search results...',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Expanded(
              child: results.isEmpty
                  ? const Center(child: Text('No results found'))
                  : ListView.builder(
                itemCount: results.length,
                itemBuilder: (_, i) =>
                    ProductItem(product: results[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
