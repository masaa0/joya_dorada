import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../models/jewelry_model.dart';
import 'bracelets_controller.dart';
import 'earrings_controller.dart';
import 'necklaces_controller.dart';
import 'rings_controller.dart';
import 'watches_controller.dart';

// puts all 80 jewelry items in one list
class CatalogController {
  List<JewelryModel> items = [];

  CatalogController() {
    items.addAll(RingsController().items);
    items.addAll(NecklacesController().items);
    items.addAll(BraceletsController().items);
    items.addAll(EarringsController().items);
    items.addAll(WatchesController().items);
  }

  List<JewelryModel> get allItems => items;

  // shop filter chips (CategoryModel)
  List<CategoryModel> get categories => [
        CategoryModel(name: 'All', icon: Icons.apps_rounded),
        CategoryModel(name: 'Rings', icon: Icons.circle_outlined),
        CategoryModel(name: 'Necklaces', icon: Icons.link_rounded),
        CategoryModel(name: 'Bracelets', icon: Icons.watch_outlined),
        CategoryModel(name: 'Earrings', icon: Icons.spa_outlined),
        CategoryModel(name: 'Watches', icon: Icons.watch_rounded),
      ];

  // home featured grid - only items with isFeatured true (10 total)
  List<JewelryModel> get featuredItems {
    List<JewelryModel> list = [];
    for (int i = 0; i < items.length; i++) {
      if (items[i].isFeatured) list.add(items[i]);
    }
    return list;
  }

  // filter by category name for shop screen
  List<JewelryModel> getItemsByCategory(String categoryName) {
    if (categoryName.toLowerCase() == 'all') return items;

    List<JewelryModel> list = [];
    for (int i = 0; i < items.length; i++) {
      if (items[i].category.toLowerCase() == categoryName.toLowerCase()) {
        list.add(items[i]);
      }
    }
    return list;
  }
}
