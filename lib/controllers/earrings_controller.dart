import '../models/jewelry_model.dart';
import 'app_images.dart';

class EarringTitles {
  static const List<String> titles = [
    'Multicolor Stone Gold Hoops',
    'Star Charm Gold Drop Earrings',
    'Brushed Disc Cascade Earrings',
    'Black Stone Fan Drop Earrings',
    'Rectangular Crystal Huggie Hoops',
    'Orb Crystal Drop Earrings',
    'Crescent Coin Fringe Earrings',
    'Polished Gold Hoop Earrings',
    'Plumeria Gold Stud Earrings',
    'Layered Shell Gold Drop Earrings',
    'Square Black Stone Studs',
    'Silver Star Orbit Drop Earrings',
    'Pave Silver Huggie Hoops',
    'Clover Gold Stud Earrings',
    'Fan Fringe Gold Earrings',
    'Open Circle Gold Drop Earrings',
  ];
}

class EarringDescriptions {
  static const List<String> descriptions = [
    'Gold hoop earrings with irregular bezels and soft multicolor stone accents.',
    'Yellow-gold star earrings with hanging bead and stone charm details.',
    'Long drop earrings made from brushed gold discs in a cascading cluster.',
    'Statement fan-shaped gold drops with black round tops and dangling charms.',
    'Compact silver-tone huggie hoops set with small clear pavé crystals.',
    'Silver crystal drop earrings with iconic orb-and-ring motif design.',
    'Gold earrings with textured crescent top and dangling coin chains.',
    'Classic polished yellow-gold hoop earrings with a rounded profile.',
    'Gold-tone floral stud earrings inspired by plumeria petals.',
    'Tiered fan-style drop earrings in polished yellow-gold finish.',
    'Square yellow-gold studs set with glossy dark center stones.',
    'Silver drop earrings with star points and orbit-inspired accents.',
    'Silver-tone huggie earrings fully covered with pavé-set crystals.',
    'Yellow-gold clover stud earrings with fine sunray engraving.',
    'Vintage-style gold earrings with fan top and chain fringe drops.',
    'Open circular drop earrings in polished yellow-gold tone.',
  ];
}

class EarringPrices {
  static const List<double> prices = [
    6200.0,
    4800.0,
    5600.0,
    7400.0,
    2100.0,
    3400.0,
    8900.0,
    3200.0,
    2650.0,
    5100.0,
    3800.0,
    2450.0,
    3100.0,
    4200.0,
    6700.0,
    4500.0,
  ];
}

class EarringMaterials {
  static const List<String> materials = [
    '18K Yellow Gold',
    '18K Yellow Gold',
    '21K Yellow Gold',
    '18K Yellow Gold',
    '925 Sterling Silver',
    '925 Sterling Silver',
    '21K Yellow Gold',
    '14K Yellow Gold',
    '14K Yellow Gold',
    '18K Yellow Gold',
    '18K Yellow Gold',
    '925 Sterling Silver',
    '999 Fine Silver',
    '18K Yellow Gold',
    '21K Yellow Gold',
    '18K Yellow Gold',
  ];
}

class EarringFeatured {
  static const List<bool> flags = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
}

class EarringImages {
  static List<String> get images {
    return AppImages.earrings;
  }
}

class EarringsController {
  static const String category = 'Earrings';

  List<JewelryModel> get items {
    List<JewelryModel> list = [];

    for (int i = 0; i < EarringTitles.titles.length; i++) {
      list.add(
        JewelryModel(
          title: EarringTitles.titles[i],
          description: EarringDescriptions.descriptions[i],
          price: EarringPrices.prices[i],
          image: EarringImages.images[i],
          category: category,
          material: EarringMaterials.materials[i],
          isFeatured: EarringFeatured.flags[i],
        ),
      );
    }

    return list;
  }
}
