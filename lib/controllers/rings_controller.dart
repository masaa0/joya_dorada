import '../models/jewelry_model.dart';
import 'app_images.dart';

// RINGS data - 16 items for shop + home featured

class RingTitles {
  static const List<String> titles = [
    'Crown Solitaire Ring',
    'Royal Enamel Cocktail Ring',
    'Plumeria Floral Gold Ring',
    'Petal Signet Gold Ring',
    'Serpenti Wrap Diamond Ring',
    'Octagon Engraved Signet Ring',
    'Oval Emerald Center Ring',
    'Pink Marquise Cluster Ring',
    'Black Stone Gold Ring',
    'Baguette Eternity Ring',
    'Rose Gold Solitaire Ring',
    'Hex Face Signet Ring',
    'Mother of Pearl Signet Ring',
    'Triple Band Bridal Set Ring',
    'Sunflower Motif Gold Ring',
    'Peridot Open Band Ring',
  ];
}

class RingDescriptions {
  static const List<String> descriptions = [
    'A white-metal solitaire ring with crown-style setting and pavé accents.',
    'An ornate gold cocktail ring with blue enamel and pearl center detailing.',
    'A two-tone gold ring with a plumeria flower top and island-inspired style.',
    'A smooth gold signet ring decorated with a delicate flower engraving.',
    'A yellow-gold serpent wrap ring set with bright clear stones.',
    'A geometric gold signet ring with engraved octagon face and vintage character.',
    'A slim gold ring with oval green center stone and side crystal accents.',
    'A graceful gold ring featuring pink marquise stones in a floral cluster.',
    'A bold yellow-gold ring with an oval black gemstone center.',
    'A gold eternity-style ring with a full row of baguette-cut clear stones.',
    'A rose-gold solitaire ring with pavé shoulders and elegant cathedral setting.',
    'A strong gold signet ring with hexagonal top and stepped shoulders.',
    'A decorative gold signet ring with scroll details and mother-of-pearl face.',
    'A silver-tone bridal set ring with round center stone and layered bands.',
    'A slim gold signet ring with sunflower motif over deep green enamel.',
    'A delicate gold open ring with peridot-like stones and small clear accents.',
  ];
}

class RingPrices {
  static const List<double> prices = [
    24500.0,
    32800.0,
    4200.0,
    6750.0,
    18900.0,
    8400.0,
    12600.0,
    9800.0,
    5200.0,
    7400.0,
    14200.0,
    9100.0,
    11500.0,
    4800.0,
    5900.0,
    2400.0,
  ];
}

class RingMaterials {
  static const List<String> materials = [
    '18K White Gold',
    '21K Yellow Gold',
    '14K Two-Tone Gold',
    '18K Yellow Gold',
    '18K Yellow Gold',
    '21K Yellow Gold',
    '18K Yellow Gold',
    '14K Rose Gold',
    '18K Yellow Gold',
    '18K Yellow Gold',
    '14K Rose Gold',
    '18K Yellow Gold',
    '21K Yellow Gold',
    '925 Sterling Silver',
    '14K Yellow Gold',
    'Gold-Plated Sterling Silver',
  ];
}

class RingFeatured {
  static const List<bool> flags = [
    true,
    false,
    true,
    false,
    true,
    false,
    true,
    false,
    true,
    true,
    true,
    false,
    false,
    false,
    false,
    false,
  ];
}

class RingImages {
  static List<String> get images {
    return AppImages.rings;
  }
}

// builds List<JewelryModel> from the lists above
class RingsController {
  static const String category = 'Rings';

  List<JewelryModel> get items {
    List<JewelryModel> list = [];

    for (int i = 0; i < RingTitles.titles.length; i++) {
      list.add(
        JewelryModel(
          title: RingTitles.titles[i],
          description: RingDescriptions.descriptions[i],
          price: RingPrices.prices[i],
          image: RingImages.images[i],
          category: category,
          material: RingMaterials.materials[i],
          isFeatured: RingFeatured.flags[i],
        ),
      );
    }

    return list;
  }
}
