import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glass/glass.dart';
import 'package:promina_agency_task/utils/app_colors.dart';
import 'package:promina_agency_task/utils/app_constants.dart';
import 'package:promina_agency_task/utils/app_images.dart';
import 'package:promina_agency_task/utils/extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: -15,
            bottom: -ScreenUtil().screenHeight / 1.15,
            child: SvgPicture.asset(
              AppImages.background,
              height: ScreenUtil().screenHeight,
              width: ScreenUtil().scaleWidth,
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            child: ListView(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 30.w, vertical: 30.h),
              children: [
                const _HeaderBody(),
                35.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _CardButtonWidget(
                      title: "log out",
                      image: AppImages.arrowRight,
                      color: AppColors.redColor,
                      onTap: () {},
                    ),
                    _CardButtonWidget(
                      title: "upload",
                      image: AppImages.arrowUp,
                      color: AppColors.yellowColor,
                      onTap: () => showPickedFileDialog(context),
                    ),
                  ],
                ),
                35.height,
                const _GridViewBody(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showPickedFileDialog(BuildContext context) {
    return showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: Colors.transparent,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 45.w),
            child: Center(
              child: Container(
                height: ScreenUtil().screenHeight / 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0EAE9).withOpacity(0.5),
                  borderRadius: 15.radius,
                  border: Border.all(
                    color: AppColors.white,
                    width: 1.5,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _CardPickedFileWidget(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    _CardPickedFileWidget(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      title: "Camera",
                      image: AppImages.camera,
                      bgColor: const Color(0xFFEBF6FF),
                    ),
                  ],
                ),
              ).asGlass(
                enabled: true,
                tintColor: Colors.transparent,
                clipBorderRadius: 15.radius,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _GridViewBody extends StatelessWidget {
  const _GridViewBody();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20.w,
        mainAxisSpacing: 20.h,
      ),
      itemCount: 30,
      itemBuilder: (BuildContext context, int index) {
        return GridTile(
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              boxShadow: AppConstants.boxShadow,
              borderRadius: 20.radius,
            ),
            child: Image.network(
              'https://ageb.net/wp-content/uploads/2019/12/2118-2.jpg',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

class _HeaderBody extends StatelessWidget {
  const _HeaderBody();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Welcome\nMina",
          style: AppConstants.textBold.copyWith(
            fontSize: 32.sp,
            color: AppColors.textColor,
          ),
        ),
        const Spacer(),
        CircleAvatar(
          radius: 25.r,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(AppImages.person),
        ),
      ],
    );
  }
}

class _CardButtonWidget extends StatelessWidget {
  const _CardButtonWidget({
    required this.onTap,
    required this.color,
    required this.title,
    required this.image,
  });
  final VoidCallback onTap;
  final Color color;
  final String title, image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            EdgeInsetsDirectional.symmetric(horizontal: 15.h, vertical: 5.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: 17.5.radius,
          boxShadow: AppConstants.boxShadow,
        ),
        child: Row(
          children: [
            Container(
              height: 30.h,
              width: 30.w,
              decoration: BoxDecoration(
                color: color,
                borderRadius: 10.radiusAll,
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.25),
                    blurRadius: 10,
                    offset: const Offset(-5, 0),
                  ),
                ],
              ),
              child: Center(
                child: SvgPicture.asset(image, height: 10.h, width: 10.w),
              ),
            ),
            15.width,
            Text(
              title,
              style: AppConstants.textBold.copyWith(
                fontSize: 20.sp,
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardPickedFileWidget extends StatelessWidget {
  const _CardPickedFileWidget({
    this.title,
    this.image,
    this.bgColor,
    required this.onTap,
  });
  final String? title, image;
  final Color? bgColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: AlignmentDirectional.center,
        child: Container(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 20.w,
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            color: bgColor ?? const Color(0xFFEFD8F9),
            borderRadius: 15.radius,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                image ?? AppImages.gellary,
                height: 32.h,
                width: 32.h,
              ),
              10.width,
              Text(
                title ?? "Gellary",
                style: AppConstants.textBold.copyWith(
                  fontFamily: "SegoeUI",
                  color: AppColors.textColor,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
