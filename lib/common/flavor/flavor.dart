import 'package:panda_shop_app/utils/constant/enums.dart';

class Flavor {
  static FlavorType flavorType = FlavorType.development;

  static String get baseURL {
    switch (flavorType) {
      case FlavorType.development:
        return 'http://45.119.85.178:8632';
      case FlavorType.staging:
        return 'http://45.119.85.178:8632';
      case FlavorType.production:
        return 'http://45.119.85.178:8632';
      default:
        return 'http://45.119.85.178:8632';
    }
  }

  static bool get isEnvProduct {
    return FlavorType.production == flavorType;
  }
}
