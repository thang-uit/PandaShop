import 'package:flutter/material.dart';
import 'package:panda_shop_app/utils/constant/sizes.dart';
import 'package:panda_shop_app/utils/device/device_utility.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle});

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ConstantSizes.defaultSpace),
      child: Column(
        children: [
          Image(
              image: AssetImage(image),
              width: DeviceUtils.getScreenWidth(context) * 0.8,
              height: DeviceUtils.getScreenHeight(context) * 0.6),
          Text(title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center),
          // const SizedBox(height: ConstantSizes.spaceBtwItems),
          Text(subTitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
