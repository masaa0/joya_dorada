import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/catalog_controller.dart';
import '../models/jewelry_model.dart';
import 'components/jewelry_image.dart';
import 'product_details_dialog.dart';

class FavoritesScreen extends StatefulWidget {
  final CatalogController controller;

  const FavoritesScreen({super.key, required this.controller});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final favorites = widget.controller.allItems
        .where((item) => item.isFavorite)
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF800020),
        foregroundColor: Colors.white,
        title: Text(
          'My Favorites',
          style: GoogleFonts.cinzel(fontWeight: FontWeight.bold),
        ),
      ),
      body: favorites.isEmpty
          ? Center(
              child: Text(
                'No favorites yet.\nTap the heart on any item.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(top: 8, bottom: 24),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final item = favorites[index];
                return _FavoriteTile(
                  item: item,
                  onTap: () {
                    openProductDetails(context, item);
                    setState(() {});
                  },
                );
              },
            ),
    );
  }
}

class _FavoriteTile extends StatelessWidget {
  final JewelryModel item;
  final VoidCallback onTap;

  const _FavoriteTile({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        onTap: onTap,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: JewelryImage(path: item.image, width: 56, height: 56),
        ),
        title: Text(
          item.title,
          style: GoogleFonts.cinzel(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '\$${item.price.toStringAsFixed(0)}',
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: const Color(0xFF800020),
          ),
        ),
        trailing: const Icon(Icons.favorite_rounded, color: Colors.red),
      ),
    );
  }
}
