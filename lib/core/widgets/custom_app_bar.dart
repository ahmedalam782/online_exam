import 'package:flutter/material.dart';
import 'package:online_exam/core/resources/values_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      this.style,
      this.automaticallyImplyLeading = false,
      this.onTap,
      this.actions});

  final String title;
  final TextStyle? style;
  final bool automaticallyImplyLeading;
  final void Function()? onTap;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return AppBar(
        leading: automaticallyImplyLeading
            ? BackButton(
                onPressed: () => Navigator.pop(context),
              )
            : null,
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: Text(
          title,
          style: style ??
              getMediumStyle(
                context: context,
                color: ColorManager.darkGray,
                fontSize: FontSize.s20,
                fontFamily: AppConstants.inter,
              ),
        ),
        actions: actions ?? [],
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
