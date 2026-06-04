import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../controllers/catalog_controller.dart';

import 'about_screen.dart';
import 'calculator_screen.dart';
import 'components/custom_drawer.dart';
import 'components/joya_app_bar.dart';
import 'home_screen.dart';
import 'shop_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  final CatalogController _controller = CatalogController();

  Widget _getCurrentScreen() {
    if (_currentIndex == 0) {
      return HomeScreen(
        controller: _controller,
        onShopTap: () => setState(() => _currentIndex = 1),
      );
    }
    if (_currentIndex == 1) {
      return ShopScreen(controller: _controller);
    }
    if (_currentIndex == 2) {
      return const CalculatorScreen();
    }
    return const AboutScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6),
      appBar: const JoyaAppBar(),
      drawer: CustomDrawer(controller: _controller),
      body: _getCurrentScreen(),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        backgroundColor: Colors.white,
        color: const Color(0xFF800020),
        buttonBackgroundColor: const Color(0xFFD4AF37),
        height: 62,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(Icons.home_rounded, size: 26, color: Colors.white),
          Icon(Icons.diamond_outlined, size: 26, color: Colors.white),
          Icon(Icons.calculate_rounded, size: 26, color: Colors.white),
          Icon(Icons.info_rounded, size: 26, color: Colors.white),
        ],
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
