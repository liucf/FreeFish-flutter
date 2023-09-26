import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freefish/common/utils/app_colors.dart';
import 'package:badges/badges.dart' as badges;

enum IconWidgetType { icon, svg, image, url }

class IconWidget extends StatelessWidget {
  final IconWidgetType type;

  final IconData? iconData;

  final String? assetName;

  final String? imageUrl;

  final double? size;

  final double? width;

  final double? height;

  final Color? color;

  final bool? isDot;

  final String? badgeString;

  final BoxFit? fit;

  const IconWidget({
    Key? key,
    this.type = IconWidgetType.icon,
    this.size,
    this.width,
    this.height,
    this.color,
    this.iconData,
    this.isDot,
    this.badgeString,
    this.assetName,
    this.imageUrl,
    this.fit,
  }) : super(key: key);

  IconWidget.icon(
    this.iconData, {
    Key? key,
    this.type = IconWidgetType.icon,
    this.size = 24,
    this.width,
    this.height,
    this.color,
    this.isDot,
    this.badgeString,
    this.assetName,
    this.imageUrl,
    this.fit,
  }) : super(key: key) {
    return;
  }

  IconWidget.image(
    this.assetName, {
    Key? key,
    this.type = IconWidgetType.image,
    this.size = 24,
    this.width,
    this.height,
    this.color,
    this.iconData,
    this.isDot,
    this.badgeString,
    this.imageUrl,
    this.fit,
  }) : super(key: key) {
    return;
  }

  IconWidget.svg(
    this.assetName, {
    Key? key,
    this.type = IconWidgetType.svg,
    this.size = 24,
    this.width,
    this.height,
    this.color,
    this.iconData,
    this.isDot,
    this.badgeString,
    this.imageUrl,
    this.fit,
  }) : super(key: key) {
    return;
  }

  IconWidget.url(
    this.imageUrl, {
    Key? key,
    this.type = IconWidgetType.url,
    this.size = 24,
    this.width,
    this.height,
    this.color,
    this.iconData,
    this.isDot,
    this.badgeString,
    this.assetName,
    this.fit,
  }) : super(key: key) {
    return;
  }

  @override
  Widget build(BuildContext context) {
    Widget? icon;
    switch (type) {
      case IconWidgetType.icon:
        icon = Icon(
          iconData,
          size: size,
          color: color ?? AppColors.primarySecondaryElementText,
        );
        break;
      case IconWidgetType.svg:
        icon = SvgPicture.asset(
          assetName!,
          width: width ?? size,
          height: height ?? size,
          fit: fit ?? BoxFit.contain,
        );
        break;
      case IconWidgetType.image:
        icon = Image.asset(
          assetName!,
          width: width ?? size,
          height: height ?? size,
          color: color,
          fit: fit ?? BoxFit.contain,
        );
        break;
      case IconWidgetType.url:
        icon = Image.network(
          imageUrl!,
          width: width ?? size,
          height: height ?? size,
          color: color,
          fit: fit ?? BoxFit.contain,
        );
        break;
      default:
        return const SizedBox();
    }

    if (isDot == true) {
      return badges.Badge(
        position: badges.BadgePosition.bottomEnd(bottom: 0, end: -2),
        child: icon,
      );
    }

    if (badgeString != null) {
      return badges.Badge(
        badgeContent: Text(
          badgeString!,
          style: const TextStyle(
            color: AppColors.primaryElement,
            fontSize: 9,
          ),
        ),
        position: badges.BadgePosition.topEnd(top: -7, end: -8),
        child: icon,
      );
    }

    return icon;
  }
}
