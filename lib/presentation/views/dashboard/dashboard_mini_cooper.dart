import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geegpay_afrique/core/constants/env_assets.dart';
import 'package:geegpay_afrique/core/constants/env_colors.dart';
import 'package:geegpay_afrique/core/constants/env_strings.dart';
import 'package:geegpay_afrique/core/constants/format_cash.dart';
import 'package:geegpay_afrique/presentation/views/dashboard/dash_mini_container_section.dart';

class MiniCooper extends StatelessWidget {
  const MiniCooper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MiniContainer(
              containerName: GeegyStrings.totalOrd,
              color: GeegyColors.primaryColor,
              containerPriceValu: GeegyStrings.dummyNumber350.toString(),
              imageAssetLink: EnvAssets.getIconPath('trending-up'),
              iconAssetLink: EnvAssets.getIconPath('order_shortcut'),
              directionalIconAssetLink: EnvAssets.getIconPath('ana1'),
            ),
            SizedBox(
              width: 15.w,
            ),
            MiniContainer(
              containerName: GeegyStrings.totalRef,
              color: GeegyColors.errorColor,
              containerPriceValu: GeegyStrings.dummyNumber270.toString(),
              imageAssetLink: EnvAssets.getIconPath(
                'trending-dn',
              ),
              iconAssetLink: EnvAssets.getIconPath('convert'),
              directionalIconAssetLink: EnvAssets.getIconPath('ana2'),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),

        ///Second row below the first row of two containers
        Row(
          children: [
            MiniContainer(
              containerName: GeegyStrings.avgSales,
              color: GeegyColors.errorColor,
              containerPriceValu: GeegyStrings.dummyNumber1567.toString(),
              imageAssetLink: EnvAssets.getIconPath(
                'trending-dn',
              ),
              iconAssetLink: EnvAssets.getIconPath('cart'),
              directionalIconAssetLink: EnvAssets.getIconPath('ana2'),
            ),
            SizedBox(
              width: 15.w,
            ),
            MiniContainer(
              containerName: GeegyStrings.totalInc,
              color: GeegyColors.primaryColor,
              containerPriceValu: formatDollarBalance(
                GeegyStrings.dummyCash350,
                noShowNaira: true,
              ),
              imageAssetLink: EnvAssets.getIconPath('trending-up'),
              iconAssetLink: EnvAssets.getIconPath('convert_coin'),
              directionalIconAssetLink: EnvAssets.getIconPath('ana1'),
            ),
          ],
        ),
      ],
    );
  }
}
