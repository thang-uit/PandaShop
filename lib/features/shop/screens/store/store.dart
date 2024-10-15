import 'package:flutter/material.dart';
import 'package:panda_shop_app/common/assets/images.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_scaffold.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';
import 'package:panda_shop_app/common/widget/box/rounded_container.dart';
import 'package:panda_shop_app/features/shop/screens/home/widgets/cart_counter.dart';
import 'package:panda_shop_app/features/shop/screens/home/widgets/search_container.dart';
import 'package:panda_shop_app/features/shop/screens/home/widgets/section_heading.dart';
import 'package:panda_shop_app/utils/constant/colors.dart';
import 'package:panda_shop_app/utils/constant/sizes.dart';
import 'package:panda_shop_app/utils/constant/texts.dart';

class StoreScreen extends BaseStatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return BaseScaffold(
      appBar: AppBar(
        title: Text("Store", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          CartCounter(
            onPressed: () {},
            padding: EdgeInsets.only(right: 10.0),
          )
        ],
      ),
      body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor:
                    isDarkMode ? ConstantColors.black : ConstantColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(ConstantSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// Search bar
                      SizedBox(
                        height: ConstantSizes.spaceBtwItems,
                      ),
                      SearchContainer(
                        text: ConstantTexts.searchInStore,
                        isShowBorder: true,
                        isShowBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(
                        height: ConstantSizes.spaceBtwSections,
                      ),

                      /// -- Featured Brands
                      SectionHeading(
                          title: ConstantTexts.featuredBrands,
                          isShowActionButton: true,
                          onPressed: () => {}),
                      const SizedBox(height: ConstantSizes.spaceBtwItems / 1.5),

                      /// Brands GRID
                      RoundedContainer(
                        padding: const EdgeInsets.all(ConstantSizes.sm),
                        isShowBorder: true,
                        backgroundColor: Colors.transparent,
                        child: Row(
                          children: [
                            /// -- Icon
                            Container(
                              width: 56,
                              height: 56,
                              padding: const EdgeInsets.all(ConstantSizes.sm),
                              decoration: BoxDecoration(
                                color: isDarkMode ? ConstantColors.black : ConstantColors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              // child: Image(
                              //   image: ,
                              // ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ];
          },
          body: Container()),
    );
  }
}
