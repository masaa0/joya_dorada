import '../models/jewelry_model.dart';
import 'app_images.dart';

class BraceletTitles {
  static const List<String> titles = [
    'Multi-Link Gold Chain Bracelet',
    'White Enamel Floral Bangle',
    'Minimal Open Gold Cuff',
    'Screw Motif Gold Bangle',
    'Wide Layered Gold Cuff',
    'Double Wrap Gold Cuff',
    'Brushed Wide Gold Cuff',
    'Silver Clover Chain Bracelet',
    'Silver Screw Motif Bangle',
    'Polished Silver Cuff',
    'Silver Stretch Link Bracelet',
    'Gold Clover Chain Bracelet',
    'Engraved Gold Bangle Set',
    'Star Set Gold Bangle',
    'Silver Crystal Tennis Bracelet',
    'Twisted Rope Gold Bracelet',
  ];
}

class BraceletDescriptions {
  static const List<String> descriptions = [
    'A layered yellow-gold chain bracelet with a secure clasp and bold everyday look.',
    'A polished gold-tone hinged bangle with white enamel and delicate floral detailing.',
    'A slim open cuff bracelet in smooth yellow-gold finish for minimalist styling.',
    'A classic gold bangle featuring iconic screw-style accents around the band.',
    'A statement cuff with multiple wide gold-tone bands in a wrapped silhouette.',
    'An open double-wrap cuff with a lightly textured center and polished gold-tone ends.',
    'A wide brushed-metal cuff in warm gold tone with a modern sculpted shape.',
    'A silver-tone chain bracelet with clover motifs and bright mother-of-pearl style centers.',
    'A sleek silver bangle with screw-inspired detailing and clean luxury lines.',
    'A smooth mirror-finish silver cuff designed as a bold modern statement piece.',
    'A flexible silver link bracelet with geometric segments and comfortable stretch fit.',
    'A yellow-gold chain bracelet with clover charms and fine decorative beaded edges.',
    'A set of slim yellow-gold bangles engraved with floral and scroll motifs.',
    'A polished yellow-gold bangle accented with star-shaped settings and clear stones.',
    'A silver-tone tennis bracelet with round crystal halos for high sparkle.',
    'A delicate twisted rope-chain bracelet in yellow-gold tone with clasp closure.',
  ];
}

class BraceletPrices {
  static const List<double> prices = [
    12400.0,
    28500.0,
    9600.0,
    14800.0,
    16200.0,
    11300.0,
    13700.0,
    3200.0,
    4100.0,
    2850.0,
    1950.0,
    10800.0,
    19600.0,
    15400.0,
    7800.0,
    8900.0,
  ];
}

class BraceletMaterials {
  static const List<String> materials = [
    '18K Yellow Gold',
    '21K Yellow Gold',
    '18K Yellow Gold',
    '18K Yellow Gold',
    '21K Yellow Gold',
    '18K Yellow Gold',
    '22K Yellow Gold',
    '925 Sterling Silver',
    '925 Sterling Silver',
    '999 Fine Silver',
    '925 Sterling Silver',
    '18K Yellow Gold',
    '21K Yellow Gold',
    '18K Yellow Gold',
    '925 Sterling Silver',
    '14K Yellow Gold',
  ];
}

class BraceletFeatured {
  static const List<bool> flags = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    true,
    false,
    false,
    false,
    false,
    true,
    false,
    false,
  ];
}

class BraceletImages {
  static List<String> get images {
    return AppImages.bracelets;
  }
}

class BraceletsController {
  static const String category = 'Bracelets';

  List<JewelryModel> get items {
    List<JewelryModel> list = [];

    for (int i = 0; i < BraceletTitles.titles.length; i++) {
      list.add(
        JewelryModel(
          title: BraceletTitles.titles[i],
          description: BraceletDescriptions.descriptions[i],
          price: BraceletPrices.prices[i],
          image: BraceletImages.images[i],
          category: category,
          material: BraceletMaterials.materials[i],
          isFeatured: BraceletFeatured.flags[i],
        ),
      );
    }

    return list;
  }
}
