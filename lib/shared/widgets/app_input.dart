import 'package:flutter/material.dart';
import 'package:small_deals/shared/utils/app_colors.dart';

class AppInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffix;
  final int minLine;
  final int maxLine;
  const AppInput({
    Key? key,
    required this.controller,
    required this.label,
    this.hintText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffix,
    this.minLine = 1,
    this.maxLine = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.0),
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.primaryText,
              ),
            ),
          ),
          TextFormField(
            controller: controller,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.primaryText,
            ),
            cursorColor: AppColors.primary,
            minLines: minLine,
            maxLines: maxLine,
            decoration: InputDecoration(
              suffix: suffix,
              filled: true,
              contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              hintText: hintText,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w300,
                color: AppColors.grayScale,
              ),
              fillColor: AppColors.whiteGray.withOpacity(.5),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.primary),
                borderRadius: BorderRadius.circular(5),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.hexToColor("#DDDDDD")),
                borderRadius: BorderRadius.circular(5),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.hexToColor("#DDDDDD")),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            validator: validator,
            keyboardType: keyboardType,
            obscureText: obscureText,
          ),
        ],
      ),
    );
  }
}
