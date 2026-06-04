import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/app_images.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: ClipOval(
              child: Image.asset(
                AppImages.brandLogo,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'Joya Dorada',
            textAlign: TextAlign.center,
            style: GoogleFonts.greatVibes(color: const Color(0xFF800020), fontSize: 40),
          ),
          Text(
            'EST. 1892  ·  TOLEDO, SPAIN',
            textAlign: TextAlign.center,
            style: GoogleFonts.cinzel(
              color: const Color(0xFFD4AF37),
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'LUSTRO ANTIGUO  ·  BRILLO ETERNO',
            textAlign: TextAlign.center,
            style: GoogleFonts.cinzel(
              color: const Color(0xFF800020),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.4,
            ),
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Column(
              children: [
                Text(
                  'Born in the quiet ateliers of Toledo, Joya Dorada is more than gold and silver — it is legacy cast in light.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: 16,
                    height: 1.55,
                    fontStyle: FontStyle.italic,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'For generations we have shaped pieces for collectors who understand that true luxury whispers — it never shouts.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey[700], height: 1.65),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Where heirloom craft meets modern grace.',
            textAlign: TextAlign.center,
            style: GoogleFonts.greatVibes(
              color: const Color(0xFFD4AF37),
              fontSize: 22,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Four salons across central Spain',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey[600], height: 1.5),
          ),
          const SizedBox(height: 24),
          Text('Our Boutiques in Spain', style: GoogleFonts.cinzel(fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text('Madrid Flagship: Calle de Serrano 45, Salamanca District', style: GoogleFonts.poppins(fontSize: 11)),
          const SizedBox(height: 5),
          Text('Guadalajara Salon: Calle Mayor 12, Guadalajara', style: GoogleFonts.poppins(fontSize: 11)),
          const SizedBox(height: 5),
          Text('Alcalá de Henares Atelier: Paseo de la Estación 8, Alcalá de Henares', style: GoogleFonts.poppins(fontSize: 11)),
          const SizedBox(height: 5),
          Text('Cuenca Gallery: Plaza Mayor 6, Cuenca', style: GoogleFonts.poppins(fontSize: 11)),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            //location 
            child: Container(
              width: double.infinity,
              height: 200,
              color: const Color(0xFFF5F3F0),
              alignment: Alignment.center,
              child: Image.asset(
                AppImages.locations,
                width: double.infinity,
                height: 200,
                fit: BoxFit.contain,
                gaplessPlayback: true,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[200],
                  alignment: Alignment.center,
                  child: const Icon(Icons.map_outlined, size: 48, color: Colors.grey),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text('Contact', style: GoogleFonts.cinzel(fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(children: [const Icon(Icons.phone_in_talk_outlined, color: Color(0xFF800020), size: 22), const SizedBox(width: 12), Text('+34 910 234 567', style: GoogleFonts.poppins(fontSize: 13))]),
          const SizedBox(height: 10),
          Row(children: [const Icon(Icons.email_outlined, color: Color(0xFF800020), size: 22), const SizedBox(width: 12), Text('boutique@joyadorada.es', style: GoogleFonts.poppins(fontSize: 13))]),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Text('Masa Anabtawi', style: GoogleFonts.poppins(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                Text('Student Number: 202311619', style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
