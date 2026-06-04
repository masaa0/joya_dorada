import '../models/jewelry_model.dart';
import 'app_images.dart';

class NecklaceTitles {
  static const List<String> titles = [
    'Layered Coin Gold Necklace',
    'Filigree Crescent Collar Necklace',
    'Gem Floral Gold Necklace',
    'Crystal Drop Statement Necklace',
    'Puffed Heart Gold Pendant',
    'Angel Charm Gold Necklace',
    'Turquoise Chain Drape Collar',
    'Scalloped Crystal Necklace',
    'V-Shape Drop Crystal Necklace',
    'Round Medallion Gold Pendant',
    'Layered Lion Coin Necklace',
    'Amphora Motif Pendant Necklace',
    'White Gold Gem Necklace',
    'Multi-Heart Charm Necklace',
    'Color Gem Link Necklace',
    'Triple Layer Cameo Necklace',
  ];
}

class NecklaceDescriptions {
  static const List<String> descriptions = [
    'A layered yellow-gold necklace set with chain textures and coin pendants.',
    'A crescent-shaped filigree collar necklace with ornate vintage gold detailing.',
    'A gold necklace with floral motifs and multicolor gemstone accents.',
    'A white crystal statement necklace with cascading teardrop-style dangles.',
    'A minimal gold chain necklace with a polished puffed heart pendant.',
    'A box-chain gold necklace with an angel charm pendant design.',
    'A decorative gold collar with turquoise centerpiece and draped chain tassels.',
    'A bright crystal necklace with scalloped structure and pear-shaped accents.',
    'A slim V-line crystal necklace finished with a teardrop center drop.',
    'A fine gold chain necklace with engraved round medallion pendant.',
    'A layered gold chain style with lion coin medallion centerpiece.',
    'A delicate gold chain with amphora-inspired pendant and small stone details.',
    'An intricate white-gold tone necklace with ornamental links and purple gems.',
    'A playful yellow-gold necklace featuring multiple polished heart charms.',
    'A gold link necklace accented with colorful bezel-set gemstone details.',
    'A three-layer gold necklace with cameo-style medallion pendants.',
  ];
}

class NecklacePrices {
  static const List<double> prices = [
    14600.0,
    22400.0,
    18900.0,
    19500.0,
    6800.0,
    5400.0,
    24700.0,
    16800.0,
    12300.0,
    8200.0,
    17500.0,
    9600.0,
    26400.0,
    7100.0,
    13900.0,
    38500.0,
  ];
}

class NecklaceMaterials {
  static const List<String> materials = [
    '18K Yellow Gold',
    '21K Yellow Gold',
    '18K Yellow Gold',
    '925 Sterling Silver',
    '14K Yellow Gold',
    '18K Yellow Gold',
    '21K Yellow Gold',
    '925 Sterling Silver',
    '999 Fine Silver',
    '18K Yellow Gold',
    '21K Yellow Gold',
    '18K Yellow Gold',
    '18K White Gold',
    '14K Yellow Gold',
    '18K Yellow Gold',
    '24K Yellow Gold',
  ];
}

class NecklaceFeatured {
  static const List<bool> flags = [
    true,
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

class NecklaceImages {
  static List<String> get images {
    return AppImages.necklaces;
  }
}

class NecklacesController {
  static const String category = 'Necklaces';

  List<JewelryModel> get items {
    List<JewelryModel> list = [];

    for (int i = 0; i < NecklaceTitles.titles.length; i++) {
      list.add(
        JewelryModel(
          title: NecklaceTitles.titles[i],
          description: NecklaceDescriptions.descriptions[i],
          price: NecklacePrices.prices[i],
          image: NecklaceImages.images[i],
          category: category,
          material: NecklaceMaterials.materials[i],
          isFeatured: NecklaceFeatured.flags[i],
        ),
      );
    }

    return list;
  }
}
