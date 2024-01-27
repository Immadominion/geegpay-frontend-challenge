import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geegpay_afrique/core/constants/env_colors.dart';
import 'package:geegpay_afrique/core/constants/env_strings.dart';
import 'package:geegpay_afrique/core/extensions/widget_extension.dart';

import 'dashboard_lists_repo.dart';
import 'last_order_body.dart';
import 'last_order_heading.dart';

class MainLastOrder extends StatefulWidget {
  const MainLastOrder({super.key});

  @override
  State<MainLastOrder> createState() => _MainLastOrderState();
}

class _MainLastOrderState extends State<MainLastOrder> {
  bool seeAllLastOrders = false;
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
                GeegyStrings.lastOrd,
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    seeAllLastOrders = !seeAllLastOrders;
                  });
                },
                child: seeAllLastOrders
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
          const LastOrderHeading(),
          SizedBox(
            width: double.maxFinite,
            height: 250.h,
            child: ListView.builder(
              itemCount: seeAllLastOrders ? 11 : 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    LastOrderBodyListView(
                      imgAsset: imgList[index],
                      name: nameList[index],
                      amt: amtList[index],
                      status: statList[index],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Divider(
                      thickness: 0.5.h,
                      height: 1.h,
                      color: GeegyColors.darkGreyColor,
                      endIndent: 10.w,
                      indent: 10.w,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
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
