import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:panda_shop_app/common/style/shadows.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';
import 'package:panda_shop_app/common/widget/image/round_image.dart';
import 'package:panda_shop_app/data/model/photo.dart';
import 'package:panda_shop_app/utils/constant/colors.dart';
import 'package:panda_shop_app/utils/constant/sizes.dart';

class ProductItemCardTest extends BaseStatelessWidget {
  const ProductItemCardTest(
      {required this.photo, this.onTap, this.onTapAdd, super.key});

  final Photo photo;
  final VoidCallback? onTap;
  final VoidCallback? onTapAdd;

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(ConstantSizes.sm),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [ShadowStyle.verticalProductShadow],
            borderRadius:
                BorderRadius.circular(ConstantSizes.productImageRadius),
            color:
                isDarkMode ? ConstantColors.darkerGrey : ConstantColors.white,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              RoundImage(
                width: 80,
                height: 80,
                imageUrl: photo.thumbnailUrl,
                isApplyImageRadius: true,
                fit: BoxFit.fill,
                borderRadius: ConstantSizes.productImageRadius,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: ConstantSizes.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        photo.title,
                        style: Theme.of(context).textTheme.labelLarge,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: ConstantSizes.spaceBtwItems / 2),
                      Row(
                        children: [
                          Text(
                            'Nike',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          const SizedBox(width: ConstantSizes.xs),
                          const Icon(
                            FontAwesomeIcons.solidCircleCheck,
                            color: ConstantColors.primary,
                            size: ConstantSizes.iconXs,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: ConstantSizes.sm),
                      child: Text(
                        "\$${photo.id}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    GestureDetector(
                      onTap: onTapAdd,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: ConstantColors.primary,
                          borderRadius: BorderRadius.all(
                            Radius.circular(ConstantSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: ConstantSizes.iconLg,
                          height: ConstantSizes.iconLg,
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: ConstantColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
