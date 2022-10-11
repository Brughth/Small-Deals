// ignore_for_file: unnecessary_this

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:small_deals/shared/utils/app_colors.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  Widget text;
  VoidCallback onPressed;
  Color? color;
  LinearGradient? gradient;
  Color? borderColor, progressColor;
  Widget? icon;
  Widget? iconRight;
  bool enable;
  bool haveTop;
  bool loading;
  Color? loadingColor;

  AppButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.enable = true,
    this.color,
    this.gradient,
    this.progressColor = AppColors.primary,
    this.borderColor,
    this.loading = false,
    this.haveTop = true,
    this.icon,
    this.iconRight,
    this.loadingColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 52,
            decoration: gradient != null
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: gradient,
                    border: borderColor != null
                        ? Border.all(color: borderColor!, width: 2)
                        : null,
                  )
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: this.color ?? AppColors.primary,
                    border: this.borderColor != null
                        ? Border.all(color: this.borderColor!, width: 2)
                        : null),
            child: InkWell(
              onTap: onPressed,
              borderRadius: BorderRadius.circular(5),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Opacity(
                  opacity: loading ? 0 : 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: getChildren(),
                  ),
                ),
              ),
            ),
          ),
          if (icon != null)
            Positioned(
              left: 7,
              child: icon!,
            ),
          loading == false
              ? Container()
              : Positioned.fill(
                  child: Center(
                    child: CupertinoTheme(
                      data: CupertinoTheme.of(context).copyWith(
                        brightness: color == AppColors.primary
                            ? Brightness.dark
                            : Brightness.light,
                      ),
                      child: CupertinoActivityIndicator(
                        radius: 16,
                        color: loadingColor,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  getChildren() {
    List<Widget> children = <Widget>[].toList();
    children.add(Container(child: this.text));
    if (this.iconRight != null) {
      children.addAll([const SizedBox(width: 18), this.iconRight!]);
    }
    return children;
  }
}
