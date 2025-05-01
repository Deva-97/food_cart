import 'package:flutter/foundation.dart';
import '../models/product.dart';

/// ViewModel for managing products, categories, and search/filter state.
class ProductViewModel extends ChangeNotifier {
  // — Private state —
  String _selectedCategory = 'Recommended';
  String _searchQuery = '';

  // — Static data —
  final List<String> _categories = [
    'Recommended',
    'Combos',
    'Regular Burgers',
    'Special',
  ];

  final List<Product> _allProducts = [
    Product(
      id: 'p1',
      name: 'Chicken Crunch Burger',
      description:
      'It is a long established fact that a reader will be distracted.',
      category: 'Recommended',
      price: 209,
      imageUrl: 'assets/images/Chicken crunch burger.png',
    ),
    Product(
      id: 'p2',
      name: 'Mighty Chicken Patty Burger',
      description:
      'It is a long established fact that a reader will be distracted.',
      category: 'Recommended',
      price: 259,
      imageUrl: 'assets/images/Mighty chicken patty burger.png',
    ),
    Product(
      id: 'p3',
      name: 'Donut Header Chicken',
      description:
      'It is a long established fact that a reader will be distracted.',
      category: 'Regular Burgers',
      price: 199,
      imageUrl: 'assets/images/Donut header chicken.png',
    ),
    Product(
      id: 'p4',
      name: 'Cheese Combo',
      description: 'Delicious combo with fries and drink.',
      category: 'Combos',
      price: 299,
      imageUrl: 'assets/images/Cheese combo.png',
    ),
    Product(
      id: 'p5',
      name: 'Special Spicy Burger',
      description: 'A fiery special burger for spice lovers.',
      category: 'Special',
      price: 279,
      imageUrl: 'assets/images/Spicy burger.png',
    ),
  ];

  // — Public getters —

  /// List of all category names.
  List<String> get categories => List.unmodifiable(_categories);

  /// Currently selected category.
  String get selectedCategory => _selectedCategory;

  /// Current search query string.
  String get searchQuery => _searchQuery;

  /// All products (unfiltered).
  List<Product> get allProducts => List.unmodifiable(_allProducts);

  // — State mutators —

  /// Update the search query and notify listeners.
  void updateSearch(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  /// Select a different category and notify listeners.
  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  // — Derived data —

  /// Products in the “Recommended” category.
  List<Product> getRecommendations() {
    return _allProducts
        .where((p) => p.category == 'Recommended')
        .toList();
  }

  /// Products filtered by a given category.
  List<Product> getProductsByCategory(String category) {
    if (category == 'Recommended') {
      return getRecommendations();
    }
    return _allProducts.where((p) => p.category == category).toList();
  }

  /// Products filtered by both the selected category and search query.
  List<Product> get filteredProducts {
    var list = getProductsByCategory(_selectedCategory);
    if (_searchQuery.isNotEmpty) {
      list = list
          .where((p) =>
          p.name.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
    return list;
  }
}
