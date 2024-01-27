import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geegpay_afrique/core/constants/env_colors.dart';
import 'package:geegpay_afrique/core/constants/env_strings.dart';

class LastOrderHeading extends StatelessWidget {
  const LastOrderHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            GeegyStrings.name,
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
              color: GeegyColors.darkGreyColor,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 2,
                child: Text(
                  GeegyStrings.dateLiteral,
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
                    color: GeegyColors.darkGreyColor,
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Flexible(
                flex: 1,
                child: Text(
                  GeegyStrings.amount,
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
                    color: GeegyColors.darkGreyColor,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  GeegyStrings.stat,
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
                    color: GeegyColors.darkGreyColor,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  GeegyStrings.inv,
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
                    color: GeegyColors.darkGreyColor,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
