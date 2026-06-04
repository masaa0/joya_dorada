import '../models/jewelry_model.dart';
import 'app_images.dart';

class WatchTitles {
  static const List<String> titles = [
    'Classic Black Strap Gold Watch',
    'Oval Gem Gold Bracelet Watch',
    'Burgundy Dial Gold Watch',
    'Slim Gold Rectangular Watch',
    'Serpenti Gold Coil Watch',
    'Rectangular Mesh Gold Watch',
    'Burgundy Tank Gold Watch',
    'Silver Oval Bracelet Watch',
    'Blue Stone Link Gold Watch',
    'Medusa Link Gold Watch',
    'Mint Dial Gold Watch',
    'Oval Stone Accent Gold Watch',
    'White Dial Gold Bracelet Watch',
    'Silver Medusa Cuff Watch',
    'Slim Oval Gold Bracelet Watch',
    'Crystal Octagon Silver Watch',
  ];
}

class WatchDescriptions {
  static const List<String> descriptions = [
    'A classic round gold-tone watch with clean dial and black leather strap.',
    'An elegant oval gold bracelet watch accented with red, blue and clear stones.',
    'A compact gold-tone watch with deep burgundy dial and linked bracelet design.',
    'A slim rectangular gold-tone watch with polished bracelet links and simple dial.',
    'A luxury yellow-gold coil bracelet watch with stone-set bezel and curved case.',
    'A square gold-tone watch with woven metal bracelet and Roman numeral dial.',
    'A geometric gold-tone watch with burgundy dial and stepped bracelet links.',
    'A silver-tone oval watch with refined bracelet and icy blue dial.',
    'A decorative gold-tone watch with blue stone inlay bracelet links.',
    'A round yellow-gold watch with Medusa-inspired links and textured dial.',
    'A minimal oval gold-tone watch featuring a soft mint-green dial.',
    'An oval yellow-gold watch with stone-accent links for a vintage jewelry look.',
    'A clean oval gold-tone watch with white dial and slim polished bracelet.',
    'A bright silver-tone watch with Medusa motif and cuff-style bracelet.',
    'A slim oval yellow-gold bracelet watch with classic Roman numeral markers.',
    'A silver-tone octagon watch with crystal-set bezel and crystal link bracelet.',
  ];
}

class WatchPrices {
  static const List<double> prices = [
    12800.0,
    28400.0,
    9600.0,
    11200.0,
    34500.0,
    14700.0,
    16900.0,
    8400.0,
    19800.0,
    24200.0,
    10500.0,
    13600.0,
    11900.0,
    15400.0,
    18700.0,
    22600.0,
  ];
}

class WatchMaterials {
  static const List<String> materials = [
    '18K Yellow Gold Case',
    '21K Yellow Gold Case',
    '18K Yellow Gold Case',
    '18K Yellow Gold Case',
    '18K Yellow Gold Case',
    '21K Yellow Gold Case',
    '18K Yellow Gold Case',
    '925 Sterling Silver Case',
    '21K Yellow Gold Case',
    '18K Yellow Gold Case',
    '18K Yellow Gold Case',
    '21K Yellow Gold Case',
    '18K White Gold Case',
    '925 Sterling Silver Case',
    '21K Yellow Gold Case',
    '925 Sterling Silver Case',
  ];
}

class WatchFeatured {
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

class WatchImages {
  static List<String> get images {
    return AppImages.watches;
  }
}

class WatchesController {
  static const String category = 'Watches';

  List<JewelryModel> get items {
    List<JewelryModel> list = [];

    for (int i = 0; i < WatchTitles.titles.length; i++) {
      list.add(
        JewelryModel(
          title: WatchTitles.titles[i],
          description: WatchDescriptions.descriptions[i],
          price: WatchPrices.prices[i],
          image: WatchImages.images[i],
          category: category,
          material: WatchMaterials.materials[i],
          isFeatured: WatchFeatured.flags[i],
        ),
      );
    }

    return list;
  }
}
