import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/catalog_controller.dart';
import '../models/category_model.dart';
import '../models/jewelry_model.dart';
import 'components/jewelry_image.dart';
import 'product_details_dialog.dart';

class ShopScreen extends StatefulWidget {
  final CatalogController controller;

  const ShopScreen({super.key, required this.controller});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  String _selectedCategory = 'All';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

// Clean up the search controller when the widget is removed
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<JewelryModel> _getFilteredItems() {
    List<JewelryModel> items = widget.controller.getItemsByCategory(
      _selectedCategory,
    );
    if (_searchQuery.isNotEmpty) {
      items = items
          .where(
            (item) =>
                item.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                item.material.toLowerCase().contains(
                  _searchQuery.toLowerCase(),
                ),
          )
          .toList();
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final items = _getFilteredItems();
    final List<CategoryModel> categories = widget.controller.categories;

    return Column(
      children: [
        // Search bar
        Container(
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore Collections',
                style: GoogleFonts.cinzel(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${widget.controller.allItems.length} pieces in catalog',
                style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _searchController,
                onChanged: (value) => setState(() => _searchQuery = value),
                decoration: InputDecoration(
                  hintText: 'Search jewels, materials...',
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: Color(0xFFD4AF37),
                  ),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear_rounded),
                          onPressed: () {
                            setState(() {
                              _searchController.clear();
                              _searchQuery = '';
                            });
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: const Color(0xFFFAF9F6),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
        //Filter chips
        Container(
          color: Colors.white,
          height: 56,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = _selectedCategory == category.name;
              return Container(
                margin: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(category.name),
                  selected: isSelected,
                  onSelected: (_) =>
                      setState(() => _selectedCategory = category.name),
                  selectedColor: const Color(0xFF800020),
                  labelStyle: GoogleFonts.poppins(
                    color: isSelected ? Colors.white : const Color(0xFF1A1A1A),
                    fontSize: 11,
                  ),
                ),
              );
            },
          ),
        ),
        const Divider(height: 1),
        //Items
        Expanded(
          child: items.isEmpty
              ? Center(
                  child: Text(
                    'No pieces found',
                    style: GoogleFonts.cinzel(fontSize: 14),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.only(top: 8, bottom: 24),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          openProductDetails(context, item);
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: SizedBox(
                                  width: 88,
                                  height: 88,
                                  child: JewelryImage(
                                    path: item.image,
                                    width: 88,
                                    height: 88,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.category.toUpperCase(),
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFFD4AF37),
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      item.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.cinzel(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      item.material,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      '\$${item.price.toStringAsFixed(2)}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF800020),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.chevron_right_rounded,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
