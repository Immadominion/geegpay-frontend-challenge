import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geegpay_afrique/core/constants/env_colors.dart';
import 'package:geegpay_afrique/core/constants/env_strings.dart';
import 'package:geegpay_afrique/core/extensions/widget_extension.dart';

class MiniContainer extends StatefulWidget {
  final String containerName;
  final String containerPriceValu;
  final String imageAssetLink;
  final String iconAssetLink;
  final String directionalIconAssetLink;
  final Color color;
  const MiniContainer(
      {super.key,
      required this.containerName,
      required this.containerPriceValu,
      required this.imageAssetLink,
      required this.iconAssetLink,
      required this.color,
      required this.directionalIconAssetLink});

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
                  widget.iconAssetLink,
                ),
              ),
              SizedBox(
                height: 50.sp,
                width: 150.sp,
                child: Image.asset(
                  widget.directionalIconAssetLink,
                ),
              ),
            ],
          ),
          Text(
            widget.containerName,
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
              color: GeegyColors.darkGreyColor,
            ),
          ),
          Text(
            widget.containerPriceValu,
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
              color: GeegyColors.darkColor,
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 70.w,
                  height: 40.h,
                  padding: EdgeInsets.all(5.sp),
                  decoration: BoxDecoration(
                    color: widget.color.withAlpha(80),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 18.sp,
                        width: 18.sp,
                        child: Image.asset(
                          widget.imageAssetLink,
                        ),
                      ),
                      Text(
                        GeegyStrings.dummyNumber1,
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w500,
                          fontSize: 11.sp,
                          color: widget.color,
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
