import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geegpay_afrique/core/constants/env_assets.dart';
import 'package:geegpay_afrique/core/constants/env_colors.dart';
import 'package:geegpay_afrique/core/constants/env_strings.dart';
import 'package:geegpay_afrique/core/extensions/widget_extension.dart';

class MiniContainer extends StatefulWidget {
  const MiniContainer({super.key});

  @override
  State<MiniContainer> createState() => _MiniContainerState();
}

class _MiniContainerState extends State<MiniContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175.h,
      width: 280.w,
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: GeegyColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 45.sp,
                width: 45.sp,
                child: Image.asset(
                  EnvAssets.getIconPath('convert'),
                ),
              ),
              SizedBox(
                height: 50.sp,
                width: 150.sp,
                child: Image.asset(
                  EnvAssets.getIconPath('ana1'),
                ),
              ),
            ],
          ),
          Text(
            'Total Order',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
              color: GeegyColors.darkGreyColor,
            ),
          ),
          Text(
            '350',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
              color: GeegyColors.darkColor,
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 70.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: GeegyColors.successColor.withAlpha(80),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 25.sp,
                        width: 25.sp,
                        child: Image.asset(
                          EnvAssets.getIconPath('trending-dn'),
                        ),
                      ),
                    ],
                  ),
                ).afmBorderRadius(BorderRadius.circular(25.r)),
                Text(
                  GeegyStrings.monthLong,
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color: GeegyColors.darkGreyColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).afmBorderRadius(
      BorderRadius.circular(
        20.r,
      ),
    );
  }
}
