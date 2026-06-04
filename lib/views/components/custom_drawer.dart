import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/catalog_controller.dart';
import '../../controllers/app_images.dart';
import '../favorites_screen.dart';

class CustomDrawer extends StatelessWidget {
  final CatalogController controller;

  const CustomDrawer({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFFAF9F6),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          children: [
            Center(
              child: ClipOval(
                child: Image.asset(
                  AppImages.brandLogo,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const CircleAvatar(
                    radius: 35,
                    backgroundColor: Color(0xFF800020),
                    child: Icon(Icons.diamond_outlined, color: Color(0xFFD4AF37), size: 32),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Joya Dorada',
              textAlign: TextAlign.center,
              style: GoogleFonts.cinzel(
                color: const Color(0xFF800020),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text('Masa Anabtawi', style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12)),
            Text('Student ID: 202311619', style: GoogleFonts.poppins(color: Colors.grey, fontSize: 11)),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 8),
            // favorites items
            ListTile(
              leading: const Icon(Icons.favorite_rounded, color: Color(0xFF800020)),
              title: Text('My Favorites', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FavoritesScreen(controller: controller),
                  ),
                );
              },
            ),
            const Divider(),
            const SizedBox(height: 8),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Icon(Icons.phone_in_talk_outlined, color: Color(0xFF800020), size: 26),
              const SizedBox(width: 14),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Contact', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text('+34 910 234 567', style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey)),
              ]),
            ]),
            const SizedBox(height: 20),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Icon(Icons.email_outlined, color: Color(0xFF800020), size: 26),
              const SizedBox(width: 14),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Email & Feedback', style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text('boutique@joyadorada.es', style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey)),
              ]),
            ]),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 12),
            Text(
              'Available items in catalog',
              style: GoogleFonts.cinzel(
                color: const Color(0xFFD4AF37),
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 12),
            for (final item in [
              (Icons.circle_outlined, 'Rings'),
              (Icons.link_rounded, 'Necklaces'),
              (Icons.watch_outlined, 'Bracelets'),
              (Icons.spa_outlined, 'Earrings'),
              (Icons.watch_rounded, 'Watches'),
            ])
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(children: [
                  Icon(item.$1, color: const Color(0xFFD4AF37), size: 20),
                  const SizedBox(width: 12),
                  Expanded(child: Text(item.$2, style: GoogleFonts.poppins(fontSize: 13))),
                  Text('16 pieces', style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey)),
                ]),
              ),
          ],
        ),
      ),
    );
  }

}
