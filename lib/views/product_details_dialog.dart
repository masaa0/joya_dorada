import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/jewelry_model.dart';
import 'components/jewelry_image.dart';

class ProductDetailsDialog extends StatefulWidget {
  final JewelryModel item;

  const ProductDetailsDialog({super.key, required this.item});

  @override
  State<ProductDetailsDialog> createState() => _ProductDetailsDialogState();
}

class _ProductDetailsDialogState extends State<ProductDetailsDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 340),
        child: Material(
          color: const Color(0xFFFAF9F6),
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close_rounded, size: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        width: 160,
                        height: 160,
                        child: JewelryImage(path: widget.item.image, width: 160, height: 160),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() => widget.item.toggleFavorite());
                          },
                          icon: Icon(
                            widget.item.isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                            color: widget.item.isFavorite ? Colors.red : Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 8),
                        OutlinedButton.icon(
                          onPressed: () {
                            setState(() => widget.item.toggleReserved());
                          },
                          icon: Icon(
                            widget.item.isReserved ? Icons.event_available_rounded : Icons.event_outlined,
                            size: 18,
                          ),
                          label: Text(
                            widget.item.isReserved ? 'Reserved' : 'Make a Reservation',
                            style: GoogleFonts.poppins(fontSize: 11),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: widget.item.isReserved ? const Color(0xFF800020) : const Color(0xFF1A1A1A),
                            side: BorderSide(
                              color: widget.item.isReserved ? const Color(0xFF800020) : Colors.grey[300]!,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.item.title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cinzel(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.item.material,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 11, color: const Color(0xFFD4AF37)),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.item.description,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey, height: 1.5),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '\$${widget.item.price.toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF800020),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void openProductDetails(BuildContext context, JewelryModel item) {
  showDialog(
    context: context,
    barrierColor: Colors.black54,
    barrierDismissible: true,
    builder: (_) => ProductDetailsDialog(item: item),
  );
}


