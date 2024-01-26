import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geegpay_afrique/core/constants/env_assets.dart';

import '../../../core/constants/env_colors.dart';

class ImageSwitcher extends StatefulWidget {
  const ImageSwitcher({super.key});

  @override
  ImageSwitcherState createState() => ImageSwitcherState();
}

class ImageSwitcherState extends State<ImageSwitcher> {
  bool isFirstImageSelected = false;

  void _switchImage() {
    setState(() {
      isFirstImageSelected = !isFirstImageSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.sp,
      margin: EdgeInsets.all(5.sp),
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        color: GeegyColors.whiteColor,
        borderRadius: BorderRadius.circular(30.sp),
      ),
      child: Column(
        children: [
          _buildImageContainer(isFirstImageSelected),
          SizedBox(
            width: 10.w,
          ),
          _buildImageContainer(!isFirstImageSelected),
        ],
      ),
    );
  }

  Widget _buildImageContainer(bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: _switchImage,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? GeegyColors.primaryColor : null,
          ),
          child: Padding(
            padding:
                isSelected ? EdgeInsets.all(8.sp) : const EdgeInsets.all(5),
            child: Image.asset(
              isSelected
                  ? EnvAssets.getIconPath('lightmode')
                  : EnvAssets.getIconPath('moon'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
