import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText, prefixText, label, text, helperText;
  final Function? specialFunc, onSaved;
  final String? Function(String?)? onFieldSubmit, onChanged, validator;
  final bool? obscureText, enabled, autofocus, height, readOnly;
  final Widget? icon, suffixIcon, suffix, prefix, prefixWidget;
  final int? maxLenght, maxLine;
  final IconData? prefixI;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextCapitalization? textCapitalization;
  final TextStyle? helperStyle;
  final void Function()? onTap;

  const AppTextFormField(
      {Key? key,
      this.prefixWidget,
      this.readOnly,
      this.prefixI,
      this.prefix,
      this.icon,
      this.specialFunc,
      this.keyboardType,
      this.validator,
      this.onSaved,
      this.suffixIcon,
      this.inputFormatters,
      this.onFieldSubmit,
      this.hintText,
      this.obscureText,
      this.label,
      this.enabled,
      this.text,
      required this.controller,
      this.maxLenght,
      this.prefixText,
      this.helperText,
      this.helperStyle,
      this.textInputAction,
      this.focusNode,
      this.autofocus,
      this.textCapitalization,
      this.suffix,
      this.onChanged,
      this.onTap,
      this.height = true,
      this.maxLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly ?? false,
      enableInteractiveSelection: true,
      autofocus: autofocus == null ? false : autofocus!,
      textCapitalization: textCapitalization == null
          ? TextCapitalization.none
          : textCapitalization!,
      keyboardType: keyboardType,
      maxLines: maxLine ?? 1,
      enabled: enabled ?? true,
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      obscuringCharacter: '●',
      maxLength: maxLenght,
      inputFormatters: inputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: onFieldSubmit,
      validator: validator,
      onTap: onTap,
      textInputAction: textInputAction,
      onChanged: onChanged,
      style: TextStyle(
        fontSize: 14,
        fontFamily: 'Questrial',
      ),
      cursorColor: AppColor.kblue,
      decoration: InputDecoration(
        counterText: '',
        prefixText: prefixText,
        hintText: hintText,
        labelText: text,
        filled: true,
        // isDense: true,
        helperText: helperText,
        helperStyle: helperStyle,
        icon: icon,
        prefixIcon: (prefixWidget) ??
            (prefixI != null
                ? Icon(
                    prefixI,
                    color: AppColor.mainColor,
                    size: 16,
                  )
                : null),
        // prefixStyle: GoogleFonts.roboto(),
        prefix: prefix,
        suffixIcon: suffixIcon,
        suffix: suffix,
        fillColor: const Color(0xFFEDE4E4).withOpacity(0.2),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        labelStyle: TextStyle(
          fontFamily: 'Questrial',
          color: AppColor.klemon,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        hintStyle: hintStyle,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 0.5,
            color: AppColor.kdarkblue,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 0.5,
            color: AppColor.kdarkblue,
            style: BorderStyle.solid,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 0.5,
            color: AppColor.kdarkblue,
            style: BorderStyle.solid,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 0.5,
            color: AppColor.kdarkblue,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}

Widget formHead(String text, {double? size}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 4.h, left: 2),
    child: Text(
      text,
      style: TextStyle(
        fontSize: size ?? 12.sp,
        color: AppColor.kdarkblue,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

class AppTextFormField2 extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText, prefixText, label, text;
  final Function? specialFunc, onSaved;
  final String? Function(String?)? onFieldSubmit, onChanged, validator;
  final bool? obscureText, enabled, autofocus, readOnly;
  final Widget? icon, suffixIcon, suffix;
  final int? maxLenght, maxLine;
  final IconData? prefixI;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextCapitalization? textCapitalization;
  final void Function()? onTap;

  const AppTextFormField2(
      {Key? key,
      this.prefixI,
      this.readOnly,
      this.icon,
      this.specialFunc,
      this.keyboardType,
      this.validator,
      this.onSaved,
      this.suffixIcon,
      this.inputFormatters,
      this.onFieldSubmit,
      this.hintText,
      this.obscureText,
      this.label,
      this.enabled,
      this.text,
      required this.controller,
      this.maxLenght,
      this.prefixText,
      this.textInputAction,
      this.focusNode,
      this.autofocus,
      this.textCapitalization,
      this.suffix,
      this.onChanged,
      this.onTap,
      this.maxLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      controller: controller,
      enableInteractiveSelection: true,
      autofocus: autofocus == null ? false : autofocus!,
      textCapitalization: textCapitalization == null
          ? TextCapitalization.none
          : textCapitalization!,
      keyboardType: keyboardType,
      maxLines: maxLine ?? 1,
      enabled: enabled ?? true,
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      obscuringCharacter: '●',
      maxLength: maxLenght,
      inputFormatters: inputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: onFieldSubmit,
      validator: validator,
      onTap: onTap,
      textInputAction: textInputAction,
      onChanged: onChanged,
      cursorColor: AppColor.mainColor,
      decoration: InputDecoration(
        counterText: '',
        prefixText: prefixText,
        hintText: hintText,
        labelText: text,
        filled: true,
        // isDense: true,
        icon: icon,
        // prefixStyle: GoogleFonts.roboto(),
        labelStyle: TextStyle(
          color: AppColor.kdarkblue,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        hintStyle: TextStyle(
          color: AppColor.kdarkblue,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: suffixIcon,
        suffix: suffix,
        fillColor: AppColor.mainColor,
        // contentPadding:
        //     const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: Color(0xFFF8F8F8), style: BorderStyle.solid),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: Color(0xFFF8F8F8), style: BorderStyle.solid),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: Color(0xFFF8F8F8), style: BorderStyle.solid),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              color: Color(0xFFF8F8F8), style: BorderStyle.solid),
        ),
      ),
    );
  }
}

class AppDropdownField extends StatelessWidget {
  const AppDropdownField({
    Key? key,
    required this.items,
    this.value,
    this.validator,
    this.onChanged,
    this.elevation = 3,
    this.prefixIcon,
    this.fillColor = Colors.white,
  }) : super(key: key);
  final List<DropdownMenuItem<String>> items;
  final String? value;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final double elevation;
  final Widget? prefixIcon;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      elevation: elevation,
      margin: EdgeInsets.zero,
      child: DropdownButtonFormField(
        items: items,
        value: value,
        onChanged: onChanged,
        style: TextStyle(color: Colors.black, fontSize: 16.sp),
        validator: validator,
        decoration: InputDecoration(
          fillColor: fillColor,
          filled: true,
          prefixIcon: prefixIcon,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFF8F8F8),
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFF8F8F8),
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDropDownField extends StatefulWidget {
  final List items;
  final String hintText;
  final dynamic value;
  final void Function(dynamic) onChanged;
  final String Function(dynamic)? validator;
  const CustomDropDownField(
      {Key? key,
      required this.items,
      required this.hintText,
      required this.value,
      required this.onChanged,
      this.validator})
      : super(key: key);

  @override
  State<CustomDropDownField> createState() => _CustomDropDownFieldState();
}

class _CustomDropDownFieldState extends State<CustomDropDownField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFFFFFFF),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
          hintText: widget.hintText,
          hintStyle: hintStyle,
          enabledBorder: outlineBorder,
          focusedBorder: outlineBorder,
          border: outlineBorder,
          errorBorder: outlineBorder,
        ),
        icon: Icon(Icons.keyboard_arrow_down, color: AppColor.kdarkblue),
        validator: widget.validator,
        value: widget.value,
        onChanged: widget.onChanged,
        items: widget.items.map((value) {
          return DropdownMenuItem(
            value: value,
            child: Text(
              '$value',
              style: TextStyle(
                color: AppColor.kdarkblue,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

TextStyle hintStyle = TextStyle(
  fontFamily: 'Questrial',
  color: AppColor.kdarkblue,
  fontSize: 12,
);

InputBorder outlineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.r),
  borderSide: BorderSide(
    width: 0.5,
    color: AppColor.kdarkblue,
    style: BorderStyle.solid,
  ),
);
