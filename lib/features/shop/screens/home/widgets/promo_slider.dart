import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';
import 'package:panda_shop_app/common/widget/custom_shape/circular_container.dart';
import 'package:panda_shop_app/common/widget/image/round_image.dart';
import 'package:panda_shop_app/features/shop/controllers/home_controller.dart';
import 'package:panda_shop_app/utils/constant/colors.dart';
import 'package:panda_shop_app/utils/constant/sizes.dart';

class PromoSlider extends BaseStatelessWidget {
  const PromoSlider({
    super.key,
    required this.listBanners,
  });

  final List<String> listBanners;

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    final controller = Get.put(HomeController());

    return Column(children: [
      CarouselSlider(
        options: CarouselOptions(
            viewportFraction: 0.8,
            autoPlay: true,
            enableInfiniteScroll: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, _) => controller.updatePageIndicator(index)),
        items: listBanners
            .map((url) => RoundImage(
                  imageUrl: url,
                  borderRadius: ConstantSizes.borderRadiusLg,
                  // boxShadow: RoundImage.defaultBoxShadow,
                ))
            .toList(),
      ),
      const SizedBox(height: ConstantSizes.spaceBtwItems),
      Center(
        child: Obx(() => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < listBanners.length; i++)
                  CircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    backgroundColor:
                        (i == controller.carousalCurrentIndex.value)
                            ? ConstantColors.primary
                            : ConstantColors.grey,
                  )
              ],
            )),
      )
    ]);
  }
}
