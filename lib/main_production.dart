import 'package:panda_shop_app/common/flavor/Flavor.dart';
import 'package:panda_shop_app/common/flavor/env.dart';
import 'package:panda_shop_app/utils/constant/enums.dart';

void main() => MainProduction();

class MainProduction extends Env {
  @override
  Future<void> init() async {
    Flavor.flavorType = FlavorType.production;
    super.init();
  }
}
