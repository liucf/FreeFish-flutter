import 'package:flutter/material.dart';
import 'package:freefish/common/utils/app_colors.dart';
import 'package:freefish/common/widgets/text_widgets.dart';

AppBar buildAppbar({String title = "Login", BuildContext? context}) {
  return AppBar(
    backgroundColor: context != null
        ? Theme.of(context).colorScheme.background
        : AppColors.primaryBackground,
    foregroundColor: context != null
        ? Theme.of(context).colorScheme.primary
        : AppColors.primaryText,
    elevation: 0,
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: AppColors.primarySecondaryElementText.withOpacity(0.3),
        height: 1,
      ),
    ),
    title: text16Normal(
      text: title,
      color: context != null
          ? Theme.of(context).colorScheme.primary
          : AppColors.primaryText,
    ),
  );
}
