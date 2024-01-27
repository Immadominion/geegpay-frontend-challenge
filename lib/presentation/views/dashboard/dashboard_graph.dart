import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geegpay_afrique/core/extensions/widget_extension.dart';
import 'package:geegpay_afrique/presentation/views/dashboard/dash_chart.dart';
import 'package:geegpay_afrique/presentation/views/dashboard/dashboard_dropdown.dart';

import '../../../core/constants/env_colors.dart';
import '../../../core/constants/env_strings.dart';

class DashboardGraph extends StatefulWidget {
  const DashboardGraph({super.key});

  @override
  State<DashboardGraph> createState() => _DashboardGraphState();
}

class _DashboardGraphState extends State<DashboardGraph> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 375.h,
      width: 730.w,
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
                GeegyStrings.salesTren,
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                ),
              ),
              Row(
                children: [
                  Text(
                    GeegyStrings.shortenDropdownText,
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  const DashboardDropdown(),
                ],
              )
            ],
          ),
          const Expanded(
            child: DashboardChart(),
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
