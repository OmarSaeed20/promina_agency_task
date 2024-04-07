import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_agency_task/utils/app_constants.dart';
import 'package:promina_agency_task/utils/enums.dart';
import 'package:promina_agency_task/utils/extensions.dart';

import 'button_animation.dart';

class BtnWidget extends StatelessWidget {
  const BtnWidget({
    super.key,
    this.title = "",
    required this.onTap,
    this.backgroundColor,
    this.titleColor = Colors.white,
    this.textStyle,
    this.child,
    this.height = 45,
    // this.width = 335,
    this.radius = 10,
    this.isBorder = false,
    this.isBuy = false,
    this.border,
    this.margin,
    this.padding,
    this.rx = RequestState.none,
    this.borderColor,
    this.borderWidth = 1,
    this.fontSize = 16,
  });

  final String? title;
  final VoidCallback? onTap;
  final BoxBorder? border;
  final Color? backgroundColor, titleColor, borderColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? margin, padding;
  final double height, radius, borderWidth, fontSize;
  // final double width;
  final Widget? child;
  final bool isBorder, isBuy;
  final RequestState rx;

  @override
  Widget build(BuildContext context) {
    return ButtonAnimation(
      onTap: rx.isLoading ? null : onTap,
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: margin,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          height: (/* context.width < 350 ? 44 : */ height).h,
          width: (rx.isLoading ? height : MediaQuery.of(context).size.width - 32).w,
          padding: padding,
          curve: Curves.easeInOutExpo,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: isBorder
                ? Border.all(
                    color: borderColor ?? Theme.of(context).primaryColor,
                    width: borderWidth,
                  )
                : border,
            // shape: rx.isLoading ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: (rx.isLoading ? 200 : radius).radius,
            color:
                backgroundColor ?? (isBuy ? const Color(0xffFE961C) : Theme.of(context).primaryColor),
          ),
          child: rx.isLoading ? const LoadingWidget() : _btnBody(context),
        ),
      ),
    );
  }

  Widget _btnBody(BuildContext context) => switch (title) {
        null => child ?? const SizedBox.shrink(),
        _ => FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title ?? "",
              textAlign: TextAlign.center,
              style: textStyle ??
                  AppConstants.titilliumSemiBold.copyWith(
                    fontSize: fontSize,
                    color: titleColor ??
                        (!AppConstants.isDarkMode(context)
                            ? const Color(0xFF080A1F)
                            : Colors.white),
                    fontWeight: FontWeight.w700,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
      };
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.valueColor = Colors.white,
    this.color,
  });
  final Color? color;
  final Color valueColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: color ?? Theme.of(context).primaryColor,
        valueColor: AlwaysStoppedAnimation<Color>(valueColor),
      ),
    );
  }
}
