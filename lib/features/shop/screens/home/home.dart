import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:panda_shop_app/common/assets/images.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_scaffold.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';
import 'package:panda_shop_app/common/widget/custom_appbar.dart';
import 'package:panda_shop_app/common/widget/custom_shape/circular_container.dart';
import 'package:panda_shop_app/common/widget/custom_shape/curved_edges.dart';
import 'package:panda_shop_app/common/widget/layouts/grid_layout.dart';
import 'package:panda_shop_app/common/widget/product/product_card_vertical.dart';
import 'package:panda_shop_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:panda_shop_app/features/shop/screens/home/widgets/search_container.dart';
import 'package:panda_shop_app/features/shop/screens/home/widgets/section_heading.dart';
import 'package:panda_shop_app/utils/constant/colors.dart';
import 'package:panda_shop_app/utils/constant/sizes.dart';
import 'package:panda_shop_app/utils/constant/texts.dart';
import 'package:panda_shop_app/utils/extension/StringExtension.dart';

class HomeScreen extends BaseStatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    final List<String> listBanners = [
      ConstantImages.imgSlider1,
      ConstantImages.imgSlider2,
      ConstantImages.imgSlider3,
      ConstantImages.imgSlider4,
      ConstantImages.imgSlider5,
      ConstantImages.imgSlider6,
    ];

    return BaseScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: CustomCurvedEdges(),
              child: HomeHeader(),
            ),

            /// Body -- Tutorial
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: PromoSlider(
                  listBanners: listBanners,
                )),

            const SizedBox(height: ConstantSizes.spaceBtwItems),

            // ProductCardVertical(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TGridLayout(
                itemCount: 8,
                mainAxisExtent: ConstantSizes.heightProductItem,
                itemBuilder: (_, index) => ProductCardVertical(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeHeader extends BaseStatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return Container(
      color: ConstantColors.primary,
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        height: 350,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: CircularContainer(
                backgroundColor: ConstantColors.white.withOpacity(0.2),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: CircularContainer(
                backgroundColor: ConstantColors.white.withOpacity(0.2),
              ),
            ),
            Positioned(
              top: 250,
              left: 0,
              child: CircularContainer(
                backgroundColor: ConstantColors.white.withOpacity(0.2),
              ),
            ),
            Column(
              children: [
                /// Cart
                const HomeCart(),
                const SizedBox(height: ConstantSizes.spaceBtwSections / 2),

                /// Search bar
                const SearchContainer(text: ConstantTexts.searchInStore),
                const SizedBox(height: ConstantSizes.spaceBtwSections / 2),

                /// Categories
                const SectionHeading(
                    title: ConstantTexts.popularCategories,
                    padding: EdgeInsets.only(
                        left: ConstantSizes.defaultSpace, right: 0.0)),
                const SizedBox(height: ConstantSizes.spaceBtwItems),
                ListCategories(
                  image: ConstantImages.icShoes,
                  title: "Hehehe",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ListCategories extends BaseStatelessWidget {
  const ListCategories(
      {super.key,
      required this.image,
      this.title,
      this.textColor = ConstantColors.black,
      this.backgroundColor = ConstantColors.white,
      this.onTap});

  static const double size = 55;

  final String image;
  final String? title;
  final Color? textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return SizedBox(
      height: 75,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                  left: ConstantSizes.defaultSpace,
                  right: ConstantSizes.defaultSpace * 0.01),
              child: GestureDetector(
                onTap: onTap,
                child: Column(
                  children: [
                    /// Circular icon
                    Container(
                      width: size,
                      height: size,
                      padding: const EdgeInsets.all(ConstantSizes.sm),
                      decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(100)),
                      child: Center(
                        child: Image(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                          width: size / 2.2,
                          height: size / 2.2,
                        ),
                      ),
                    ),
                    if (!title.isNullEmptyOrWhitespace)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                              height: ConstantSizes.spaceBtwItems / 6),
                          SizedBox(
                            width: size + 2.0,
                            child: Center(
                              child: Text(
                                title ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.apply(color: textColor),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        ],
                      )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class HomeCart extends BaseStatelessWidget {
  const HomeCart({
    super.key,
  });

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return CustomAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(ConstantTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.apply(color: ConstantColors.textPrimary),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
          Text(
            "Thang Beo Ne",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.apply(color: ConstantColors.textPrimary),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
      actions: [
        Stack(
          children: [
            IconButton(
                onPressed: () => {},
                icon: const FaIcon(FontAwesomeIcons.bagShopping),
                color: ConstantColors.black),
            Positioned(
                right: 0,
                top: 4,
                child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                        color: ConstantColors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "0",
                        style: Theme.of(context).textTheme.labelLarge?.apply(
                            color: ConstantColors.white, fontSizeFactor: 0.8),
                      ),
                    )))
          ],
        )
      ],
    );
  }
}
