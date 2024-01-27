import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geegpay_afrique/core/constants/env_colors.dart';
import 'package:geegpay_afrique/core/constants/env_strings.dart';
import 'package:geegpay_afrique/core/constants/format_cash.dart';

import '../../../core/constants/env_assets.dart';

class LastOrderBodyListView extends StatelessWidget {
  final String imgAsset;
  final String name;
  final String amt;
  final String status;
  const LastOrderBodyListView({
    super.key,
    required this.imgAsset,
    required this.name,
    required this.amt,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                child: Image.asset(
                  imgAsset,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                name,
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp,
                  color: GeegyColors.darkColor,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Nov 15, 2023',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  color: GeegyColors.darkGreyColor,
                ),
              ),
              SizedBox(
                width: 50.w,
              ),
              Flexible(
                flex: 1,
                child: Text(
                  formatDollarBalance(
                    amt,
                    noShowNaira: true,
                  ),
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp,
                    color: GeegyColors.darkColor,
                  ),
                ),
              ),
              SizedBox(
                width: 47.w,
              ),
              Flexible(
                flex: 1,
                child: Text(
                  status,
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
                    color: status == GeegyStrings.pd
                        ? GeegyColors.successColor
                        : GeegyColors.errorColor,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      EnvAssets.getIconPath(
                        'view',
                      ),
                    ),
                    Text(
                      GeegyStrings.vw,
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        color: GeegyColors.darkColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 25.w,
              ),
            ],
          ),
        )
      ],
    );
  }
}
