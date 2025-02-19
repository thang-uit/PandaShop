import 'package:panda_shop_app/utils/constant/enums.dart';

class Flavor {
  static FlavorType flavorType = FlavorType.development;

  static String get baseURL {
    switch (flavorType) {
      case FlavorType.development:
        return 'https://jsonplaceholder.typicode.com';
      case FlavorType.staging:
        return 'https://jsonplaceholder.typicode.com';
      case FlavorType.production:
        return 'https://jsonplaceholder.typicode.com';
      default:
        return 'https://jsonplaceholder.typicode.com';
    }
  }

  static bool get isEnvProduct {
    return FlavorType.production == flavorType;
  }
}
