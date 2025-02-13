import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.label,
    this.hint,
    this.autoValidateMode,
    this.isObscured = false,
    this.iconData,
    this.textInputType = TextInputType.text,
    this.hintTextStyle,
    this.labelTextStyle,
    this.cursorColor,
    this.readOnly = false,
    this.validation,
    this.onTap,
    this.maxLines,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final bool isObscured;
  final String? label;
  final String? hint;
  final AutovalidateMode? autoValidateMode;
  final TextInputType textInputType;
  final IconData? iconData;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final Color? cursorColor;
  final bool readOnly;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validation;
  final void Function()? onTap;
  final void Function(String)? onChanged;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool hidden = widget.isObscured;
  String? errorText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines ?? 1,
      controller: widget.controller,
      focusNode: widget.focusNode,
      readOnly: widget.readOnly,
      autovalidateMode: widget.autoValidateMode,
      style: getBoldStyle(
        color: ColorManager.darkGray,
        context: context,
        fontSize: FontSize.s16,
        fontFamily: AppConstants.roboto,
      ),
      obscureText: hidden,
      keyboardType: widget.textInputType,
      obscuringCharacter: '*',
      cursorColor: widget.cursorColor ?? ColorManager.blue,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      onEditingComplete: () {
        widget.focusNode?.unfocus();
        if (widget.nextFocus != null) {
          FocusScope.of(context).requestFocus(widget.nextFocus);
        }
      },
      textInputAction: widget.nextFocus == null
          ? TextInputAction.done
          : TextInputAction.next,
      validator: (value) {
        if (widget.validation == null) {
          setState(() => errorText = null);
        } else {
          setState(() => errorText = widget.validation!(value));
        }
        return errorText;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(Insets.s16),
        hintText: widget.hint,
        labelText: widget.label,
        labelStyle: widget.labelTextStyle ??
            getRegularStyle(
              color: errorText != null
                  ? ColorManager.red
                  : ColorManager.mediumGray,
              context: context,
              fontFamily: AppConstants.roboto,
              fontSize: FontSize.s12,
            ),

        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isObscured
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: Insets.s16),
                child: IconButton(
                  onPressed: () => setState(() => hidden = !hidden),
                  iconSize: 24,
                  splashRadius: 10,
                  isSelected: !hidden,
                  color: widget.cursorColor,
                  selectedIcon: Icon(
                    Icons.visibility_off_outlined,
                    color: ColorManager.mediumGray,
                  ),
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: ColorManager.mediumGray,
                  ),
                ),
              )
            : widget.suffixIcon,
        hintStyle: widget.hintTextStyle ??
            getRegularStyle(
              color: ColorManager.silver,
              context: context,
              fontFamily: AppConstants.roboto,
              fontSize: FontSize.s14,
            ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            strokeAlign: BorderSide.strokeAlignInside,
            color: ColorManager.mediumGray,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            strokeAlign: BorderSide.strokeAlignInside,
            color: ColorManager.red,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            strokeAlign: BorderSide.strokeAlignInside,
            color: errorText != null ? ColorManager.red : ColorManager.blue,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            strokeAlign: BorderSide.strokeAlignInside,
            color: ColorManager.mediumGray,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4.r),
        ),
        errorStyle: getRegularStyle(
          color: ColorManager.red,
          context: context,
          fontFamily: AppConstants.roboto,
          fontSize: FontSize.s12,
        ),
      ),
    );
  }
}
