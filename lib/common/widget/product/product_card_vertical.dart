import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:panda_shop_app/common/assets/images.dart';
import 'package:panda_shop_app/common/style/shadows.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';
import 'package:panda_shop_app/common/widget/box/circular_icon.dart';
import 'package:panda_shop_app/common/widget/box/rounded_container.dart';
import 'package:panda_shop_app/common/widget/image/round_image.dart';
import 'package:panda_shop_app/utils/constant/colors.dart';
import 'package:panda_shop_app/utils/constant/sizes.dart';

class ProductCardVertical extends BaseStatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        width: 180,
        decoration: BoxDecoration(
            boxShadow: [ShadowStyle.verticalProductShadow],
            borderRadius:
                BorderRadius.circular(ConstantSizes.productImageRadius),
            color:
                isDarkMode ? ConstantColors.darkerGrey : ConstantColors.white),
        child: Column(
          children: [
            RoundedContainer(
              backgroundColor:
                  isDarkMode ? ConstantColors.dark : ConstantColors.light,
              child: Stack(
                children: [
                  const RoundImage(
                      imageUrl: ConstantImages.imgProduct1_1,
                      isApplyImageRadius: true,
                      fit: BoxFit.fill,
                      borderRadius: ConstantSizes.productImageRadius),
                  Positioned(
                      top: 8,
                      left: 4,
                      child: RoundedContainer(
                        radius: ConstantSizes.sm,
                        backgroundColor:
                            ConstantColors.primary.withOpacity(0.6),
                        padding: const EdgeInsets.symmetric(
                            horizontal: ConstantSizes.sm,
                            vertical: ConstantSizes.xs),
                        child: Text(
                          "25%",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.apply(color: ConstantColors.black),
                        ),
                      )),
                  const Positioned(
                      top: 7,
                      right: 4,
                      width: ConstantSizes.iconLg,
                      height: ConstantSizes.iconLg,
                      child: CircularIcon(
                        icon: FontAwesomeIcons.solidHeart,
                        color: Colors.red,
                        size: ConstantSizes.iconSm,
                      ))
                ],
              ),
            ),

            /// Details
            Padding(
              padding: const EdgeInsets.only(left: ConstantSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Áo chị ong nâu nâu no no",
                    style: Theme.of(context).textTheme.labelLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: ConstantSizes.spaceBtwItems / 2,
                  ),
                  Row(
                    children: [
                      Text('Nike',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.labelMedium),
                      const SizedBox(width: ConstantSizes.xs),
                      const Icon(
                        FontAwesomeIcons.solidCircleCheck,
                        color: ConstantColors.primary,
                        size: ConstantSizes.iconXs,
                      ),
                      // Icon(icon)
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                Padding(
                  padding: const EdgeInsets.only(left: ConstantSizes.sm),
                  child: Text("\$40.5",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineSmall),
                ),

                /// Add to cart
                Container(
                  decoration: const BoxDecoration(
                      color: ConstantColors.primary,
                      borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(ConstantSizes.productImageRadius),
                          bottomRight: Radius.circular(
                              ConstantSizes.productImageRadius))),
                  child: const SizedBox(
                    width: ConstantSizes.iconLg,
                    height: ConstantSizes.iconLg,
                    child: Center(
                        child: Icon(
                      Icons.add,
                      color: ConstantColors.white,
                    )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
