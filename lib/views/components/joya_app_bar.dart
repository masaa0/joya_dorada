import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JoyaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const JoyaAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Color(0xFF1A1A1A)),
      centerTitle: true,
      title: Text(
        'Luxurious Jewelry Shop Catalog',
        style: GoogleFonts.cormorantGaramond(
          color: const Color(0xFF800020),
          fontWeight: FontWeight.w600,
          fontSize: 21,
          letterSpacing: 2.8,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
