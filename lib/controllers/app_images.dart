// paths to my images (assets folder + banner from internet)
class AppImages {
  static const String brandLogo = 'assets/logo/joya_dorada_logo.png';
  static const String locations = 'assets/images/locations.png';
  static const String banner = 'https://files.catbox.moe/5k5x21.jpg';


  static List<String> _local(String folder) {
    List<String> list = [];
    for (int i = 1; i <= 16; i++) {
      final num = i.toString().padLeft(2, '0');
      list.add('assets/images/$folder/$num.jpg');
    }
    return list;
  }

  static final List<String> rings = _local('rings');
  static final List<String> necklaces = _local('necklaces');
  static final List<String> bracelets = _local('bracelets');
  static final List<String> earrings = _local('earrings');
  static final List<String> watches = _local('watches');
}
