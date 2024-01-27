import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geegpay_afrique/core/constants/env_colors.dart';
import 'package:geegpay_afrique/core/constants/env_strings.dart';
import 'package:geegpay_afrique/core/constants/format_cash.dart';
import 'package:geegpay_afrique/core/extensions/widget_extension.dart';
import 'package:geegpay_afrique/presentation/views/dashboard/dash_top_platform_widget.dart';

import 'dashboard_lists_repo.dart';

class TopPlatforms extends StatefulWidget {
  const TopPlatforms({super.key});

  @override
  State<TopPlatforms> createState() => _TopPlatformsState();
}

class _TopPlatformsState extends State<TopPlatforms> {
  bool seeAllPlatforms = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 375.h,
      width: 575.w,
      padding: EdgeInsets.all(20.sp),
      decoration: BoxDecoration(
        color: GeegyColors.whiteColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                GeegyStrings.topPlat,
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    seeAllPlatforms = !seeAllPlatforms;
                  });
                },
                child: seeAllPlatforms
                    ? Row(
                        children: [
                          Icon(
                            Icons.close,
                            size: 15.sp,
                          ).afmPadding(
                            EdgeInsets.only(right: 5.w),
                          ),
                          Text(
                            GeegyStrings.clAll,
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              color: GeegyColors.warningColor,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        GeegyStrings.seeAll,
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: GeegyColors.primaryColor,
                        ),
                      ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            width: double.maxFinite,
            height: 250.h,
            child: ListView.builder(
              itemCount: seeAllPlatforms ? 11 : 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    TopPlatformWidget(
                        platformName: platformNameList[index],
                        price: formatDollarBalance(
                          platformPriceList[index],
                          noShowNaira: false,
                        ),
                        percent: platformPercentageDoubles[index],
                        color: platformColor[index],
                        percentStringLiteral:
                            "+${platformStringLiteral[index]}%"),
                  ],
                );
              },
            ),
          )
        ],
      ),
    ).afmBorderRadius(
      BorderRadius.circular(
        20.r,
      ),
    );
  }
}
