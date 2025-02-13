import 'package:flutter/material.dart';
import 'package:panda_shop_app/common/assets/images.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';
import 'package:panda_shop_app/utils/constant/colors.dart';

class RoundImage extends BaseStatelessWidget {
  static List<BoxShadow> defaultBoxShadow = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5), // màu của bóng đổ
      spreadRadius: 2, // độ rộng của vùng bóng đổ
      blurRadius: 2, // độ nhòe của bóng đổ
      offset: const Offset(0, 3), // dịch chuyển bóng đổ theo trục x, y
    )
  ];

  const RoundImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.isApplyImageRadius = true,
    this.border,
    required this.borderRadius,
    this.backgroundColor = ConstantColors.grey,
    this.boxShadow,
    this.fit = BoxFit.cover,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
  });

  final double? width;
  final double? height;
  final String imageUrl;
  final bool isApplyImageRadius;
  final BoxBorder? border;
  final double borderRadius;
  final Color? backgroundColor;
  final List<BoxShadow>? boxShadow;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
              border: border,
              color: backgroundColor,
              boxShadow: boxShadow,
              borderRadius: BorderRadius.circular(borderRadius)),
          child: ClipRRect(
            borderRadius: isApplyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: Image(
              image: isNetworkImage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl) as ImageProvider,
              fit: fit,
              errorBuilder: (context, error, stackTrace) {
                return Image(
                  image: AssetImage(ConstantImages.appLogoBgFull),
                );
              },
            ),
          )),
    );
  }
}
