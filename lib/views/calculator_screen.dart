import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/calculator_controller.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _metal = 'Gold';
  String _purity = '24K';
  double _grams = 10.0;
  final TextEditingController _gramsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _gramsController.text = _grams.toStringAsFixed(1);
  }

  @override
  void dispose() {
    _gramsController.dispose();
    super.dispose();
  }

  double get _rate => CalculatorController.getRate(_metal, _purity);
  double get _total => CalculatorController.calculateTotal(_metal, _purity, _grams);

  void _adjustGrams(double amount) {
    final newVal = (_grams + amount).clamp(0.0, double.infinity);
    setState(() {
      _grams = newVal;
      _gramsController.text = _grams.toStringAsFixed(1);
    });
  }
  //market urls
  void _openLiveMarket(String metal) {
    final url = metal == 'Gold'
        ? 'https://www.tradingview.com/symbols/XAUUSD/'
        : 'https://www.tradingview.com/symbols/XAGUSD/';
    launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    final purities = CalculatorController.getPurities(_metal);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Gold & Silver Calculator', style: GoogleFonts.cinzel(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(
            'USD rates per gram (May 2026 reference).',
            style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey, height: 1.5),
          ),
          const SizedBox(height: 28),
          _sectionLabel('Select Precious Metal'),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            initialValue: _metal,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
            items: CalculatorController.metals
                .map((m) => DropdownMenuItem(value: m, child: Text(m)))
                .toList(),
            onChanged: (val) {
              if (val != null) {
                setState(() {
                  _metal = val;
                  _purity = CalculatorController.getPurities(val).first;
                });
              }
            },
          ),
          const SizedBox(height: 22),
          _sectionLabel('Select Purity'),
          const SizedBox(height: 8),
          //purity section
          Row(
            children: [
              for (final p in purities) ...[
                ChoiceChip(
                  label: Text(p),
                  selected: _purity == p,
                  onSelected: (_) => setState(() => _purity = p),
                  selectedColor: const Color(0xFF800020),
                  labelStyle: GoogleFonts.poppins(
                    color: _purity == p ? Colors.white : const Color(0xFF1A1A1A),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ],
          ),
          const SizedBox(height: 26),
          _sectionLabel('Weight (grams)'),
          const SizedBox(height: 8),
          //weight section
          Row(
            children: [
              _circleBtn(Icons.remove, () => _adjustGrams(-1)),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: _gramsController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    final parsed = double.tryParse(value) ?? 0.0;
                    setState(() => _grams = parsed >= 0 ? parsed : 0.0);
                  },
                ),
              ),
              const SizedBox(width: 12),
              _circleBtn(Icons.add, () => _adjustGrams(1)),
            ],
          ),
          const SizedBox(height: 36),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFD4AF37)),
            ),
            child: Column(
              children: [
                Text('Estimated Value (USD)', style: GoogleFonts.cinzel(fontSize: 11, color: Colors.grey)),
                const SizedBox(height: 14),
                Text(
                  '\$${_total.toStringAsFixed(2)}',
                  style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.bold, color: const Color(0xFF800020)),
                ),
                const SizedBox(height: 10),
                Text(
                  'Rate: \$${_rate.toStringAsFixed(2)} / gram',
                  style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          //market buttons
          ElevatedButton(
            onPressed: () => _openLiveMarket(_metal),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF800020),
              foregroundColor: Colors.white,
            ),
            child: Text(_metal == 'Gold' ? 'Live Gold Market' : 'Live Silver Market'),
          ),
        ],
      ),
    );
  }
  //section label
  Widget _sectionLabel(String text) {
    return Text(text, style: GoogleFonts.cinzel(fontSize: 12, fontWeight: FontWeight.bold));
  }
  //circle button
  Widget _circleBtn(IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(12),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF800020),
      ),
      child: Icon(icon),
    );
  }
}
