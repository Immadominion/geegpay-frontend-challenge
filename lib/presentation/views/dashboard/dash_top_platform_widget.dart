// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geegpay_afrique/core/extensions/widget_extension.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../core/constants/env_colors.dart';

class TopPlatformWidget extends StatefulWidget {
  final String platformName;
  final String percentStringLiteral;
  final String price;
  final double percent;
  final Color color;
  const TopPlatformWidget(
      {super.key,
      required this.platformName,
      required this.price,
      required this.percent,
      required this.color,
      required this.percentStringLiteral});

  @override
  State<TopPlatformWidget> createState() => _TopPlatformWidgetState();
}

class _TopPlatformWidgetState extends State<TopPlatformWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.platformName,
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w600,
            fontSize: 13.sp,
            color: GeegyColors.darkColor,
          ),
        ).afmPadding(
          EdgeInsets.only(
            left: 11.w,
            bottom: 8.h,
          ),
        ),
        LinearPercentIndicator(
          width: 530.w,
          animation: true,
          lineHeight: 15.h,
          animationDuration: 2500,
          percent: widget.percent,
          barRadius: Radius.circular(
            10.r,
          ),
          linearStrokeCap: LinearStrokeCap.roundAll,
          progressColor: widget.color,
        ),
        // SizedBox(
        //   height: 5.h,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.price,
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: GeegyColors.darkGreyColor,
              ),
            ),
            Text(
              widget.percentStringLiteral,
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w500,
                fontSize: 13.sp,
                color: GeegyColors.darkGreyColor,
              ),
            ),
          ],
        ).afmPadding(
          EdgeInsets.only(
            right: 20.w,
            left: 13.w,
          ),
        ),
      ],
    );
  }
}
