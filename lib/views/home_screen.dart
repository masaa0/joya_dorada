import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/app_images.dart';
import '../controllers/catalog_controller.dart';
import '../controllers/market_prices_controller.dart';
import '../models/jewelry_model.dart';
import '../models/market_price_model.dart';
import 'components/jewelry_image.dart';
import 'product_details_dialog.dart';

// HOME tab - banner, metal rates, featured grid
class HomeScreen extends StatefulWidget {
  final CatalogController controller;
  final VoidCallback onShopTap;

  const HomeScreen({
    super.key,
    required this.controller,
    required this.onShopTap,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MarketPricesController _marketController = MarketPricesController();

  @override
  Widget build(BuildContext context) {
    final featured = widget.controller.featuredItems;
    final rates = _marketController.prices;

    // whole page scrolls
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _welcomeBanner(),
          const SizedBox(height: 24),

          // section title - daily gold/silver rates
          Text(
            'Metal Rates (USD / gram)',
            style: GoogleFonts.cinzel(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          // metal rates - one row, each card shares screen width 
          Row(
            children: [
              for (int i = 0; i < rates.length; i++) ...[
                if (i > 0) const SizedBox(width: 6),
                Expanded(child: _rateCard(rates[i])),
              ],
            ],
          ),

          const SizedBox(height: 24),

          // featured title + button to shop tab
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Featured Masterpieces',
                style: GoogleFonts.cinzel(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: widget.onShopTap,
                child: Text(
                  'View All',
                  style: GoogleFonts.poppins(color: const Color(0xFFD4AF37)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // featured items — Column of Rows, 2 cards per row
          Column(
            children: [
              for (int i = 0; i < featured.length; i += 2)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _FeaturedCard(
                        item: featured[i],
                        onDetails: () { openProductDetails(context, featured[i]); setState(() {}); },
                      )),
                      const SizedBox(width: 12),
                      if (i + 1 < featured.length)
                        Expanded(child: _FeaturedCard(
                          item: featured[i + 1],
                          onDetails: () { openProductDetails(context, featured[i + 1]); setState(() {}); },
                        ))
                      else
                        const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  // top banner - network image + shop name text
  Widget _welcomeBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Stack(
        children: [
          // banner photo from internet
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.network(AppImages.banner, fit: BoxFit.cover),
          ),
          // dark red overlay so text is readable
          Container(
            height: 200,
            color: const Color(0xFF800020).withValues(alpha: 0.75),
          ),
          // shop name + tagline
          SizedBox(
            height: 200,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Joya Dorada',
                    style: GoogleFonts.greatVibes(
                      color: const Color(0xFFD4AF37),
                      fontSize: 48,
                    ),
                  ),
                  Text(
                    'SPANISH HERITAGE  ·  MODERN LUXURY',
                    style: GoogleFonts.cinzel(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Fine gold & silver, crafted in Spain.',
                    style: GoogleFonts.cormorantGaramond(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // small white box for one metal price (width comes from Expanded in the Row)
  Widget _rateCard(MarketPriceModel r) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            r.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 8, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '\$${r.price.toStringAsFixed(2)}',
              style: GoogleFonts.poppins(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  r.isUp ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  size: 14,
                  color: r.isUp ? Colors.green : Colors.red,
                ),
                Text(
                  r.change,
                  style: GoogleFonts.poppins(
                    fontSize: 8,
                    color: r.isUp ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// one featured jewelry card on home
class _FeaturedCard extends StatelessWidget {
  final JewelryModel item;
  final VoidCallback onDetails;

  const _FeaturedCard({required this.item, required this.onDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          // product photo
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: SizedBox(
              height: 160,
              width: double.infinity,
              child: JewelryImage(path: item.image, fit: BoxFit.cover),
            ),
          ),
          // title + price
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.cinzel(fontSize: 11),
                ),
                Text(
                  '\$${item.price.toStringAsFixed(0)}',
                  style: GoogleFonts.poppins(color: const Color(0xFF800020)),
                ),
              ],
            ),
          ),
          // opens details popup
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: OutlinedButton(
              onPressed: onDetails,
              child: const Text('Details'),
            ),
          ),
        ],
      ),
    );
  }
}
