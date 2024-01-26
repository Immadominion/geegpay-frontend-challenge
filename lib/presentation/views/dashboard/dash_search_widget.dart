import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geegpay_afrique/core/constants/env_assets.dart';
import 'package:geegpay_afrique/core/constants/env_colors.dart';
import 'package:geegpay_afrique/core/constants/env_strings.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 300.w,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.sp),
        color: GeegyColors.whiteColor,
        border: Border.all(
          width: 1,
          color: GeegyColors.greyColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          Image.asset(
            EnvAssets.getIconPath('search'),
            width: 30.w,
            height: 30.h,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  hintText: GeegyStrings.search,
                  //alignLabelWithHint: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(bottom: 5.w),
                ),
              ),
            ),
          ),
          // const SizedBox(width: 10),
        ],
      ),
    );
  }
}
