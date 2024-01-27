import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geegpay_afrique/core/constants/env_assets.dart';
import 'package:geegpay_afrique/core/constants/env_colors.dart';
import 'package:geegpay_afrique/core/extensions/widget_extension.dart';

import 'dashboard_widgets.dart';
import 'image_switcher.dart';

class SideBarDesktop extends StatefulWidget {
  const SideBarDesktop({super.key});

  @override
  State<SideBarDesktop> createState() => _SideBarDesktopState();
}

class _SideBarDesktopState extends State<SideBarDesktop> {
  String _activeImage = '';

  @override
  void initState() {
    _activeImage = 'menu';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: GeegyColors.greyColor,
        border: Border(
          right: BorderSide(
            width: 1.sp,
            color: GeegyColors.darkGreyColor,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // margin: EdgeInsets.only(top: 10.h),
            child: Image.asset(
              EnvAssets.getIconPath('thumbnail'),
            ).afmPadding(
              EdgeInsets.all(15.sp),
            ),
          ),
          Flexible(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _activeImage = 'menu';
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    EnvAssets.getIconPath('menu'),
                    color: _activeImage == 'menu'
                        ? null
                        : GeegyColors.darkGreyColor,
                  )
                      .afmPadding(
                        EdgeInsets.all(6.sp),
                      )
                      .afmPadding(
                        EdgeInsets.only(
                          left: 10.w,
                        ),
                      ),
                  const Spacer(),
                  _activeImage == 'menu'
                      ? const TabIndicator()
                      : const SizedBox()
                ],
              ),
            ),
          ),
          Flexible(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _activeImage = 'analysis';
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    EnvAssets.getIconPath('analysis'),
                    color: _activeImage == 'analysis'
                        ? null
                        : GeegyColors.darkGreyColor,
                  )
                      .afmPadding(
                        EdgeInsets.all(6.sp),
                      )
                      .afmPadding(
                        EdgeInsets.only(
                          left: 10.w,
                        ),
                      ),
                  _activeImage == 'analysis'
                      ? const TabIndicator()
                      : const SizedBox()
                ],
              ),
            ),
          ),
          Flexible(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _activeImage = 'user';
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    EnvAssets.getIconPath('user'),
                    color: _activeImage == 'user'
                        ? null
                        : GeegyColors.darkGreyColor,
                  )
                      .afmPadding(
                        EdgeInsets.all(15.sp),
                      )
                      .afmPadding(
                        EdgeInsets.only(
                          left: 10.w,
                        ),
                      ),
                  _activeImage == 'user'
                      ? const TabIndicator()
                      : const SizedBox()
                ],
              ),
            ),
          ),
          Flexible(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _activeImage = 'box';
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    EnvAssets.getIconPath('box'),
                    color: _activeImage == 'box'
                        ? null
                        : GeegyColors.darkGreyColor,
                  )
                      .afmPadding(
                        EdgeInsets.all(6.sp),
                      )
                      .afmPadding(
                        EdgeInsets.only(
                          left: 10.w,
                        ),
                      ),
                  _activeImage == 'box'
                      ? const TabIndicator()
                      : const SizedBox()
                ],
              ),
            ),
          ),
          Flexible(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _activeImage = 'percentages';
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    EnvAssets.getIconPath('percentages'),
                    color: _activeImage == 'percentages'
                        ? null
                        : GeegyColors.darkGreyColor,
                  )
                      .afmPadding(
                        EdgeInsets.all(6.sp),
                      )
                      .afmPadding(
                        EdgeInsets.only(
                          left: 10.w,
                        ),
                      ),
                  _activeImage == 'percentages'
                      ? const TabIndicator()
                      : const SizedBox()
                ],
              ),
            ),
          ),
          Flexible(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _activeImage = 'notification';
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    EnvAssets.getIconPath('notification'),
                    color: _activeImage == 'notification'
                        ? null
                        : GeegyColors.darkGreyColor,
                  )
                      .afmPadding(
                        EdgeInsets.all(6.sp),
                      )
                      .afmPadding(
                        EdgeInsets.only(
                          left: 10.w,
                        ),
                      ),
                  _activeImage == 'notification'
                      ? const TabIndicator()
                      : const SizedBox()
                ],
              ),
            ),
          ),
          const ImageSwitcher(),
          const Spacer(),
          Flexible(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _activeImage = 'arrow-right';
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    EnvAssets.getIconPath('arrow-right'),
                    color: _activeImage == 'arrow-right'
                        ? null
                        : GeegyColors.darkGreyColor,
                  )
                      .afmPadding(
                        EdgeInsets.all(13.sp),
                      )
                      .afmPadding(
                        EdgeInsets.only(
                          left: 10.w,
                        ),
                      ),
                  _activeImage == 'arrow-right'
                      ? const TabIndicator()
                      : const SizedBox()
                ],
              ),
            ),
          ),
          Flexible(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _activeImage = 'settings';
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    EnvAssets.getIconPath('settings'),
                    color: _activeImage == 'settings'
                        ? null
                        : GeegyColors.darkGreyColor,
                  )
                      .afmPadding(
                        EdgeInsets.all(5.sp),
                      )
                      .afmPadding(
                        EdgeInsets.only(
                          left: 10.w,
                        ),
                      ),
                  _activeImage == 'settings'
                      ? const TabIndicator()
                      : const SizedBox()
                ],
              ),
            ),
          ),
          Flexible(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _activeImage = 'logout';
                    });
                  },
                  child: Image.asset(
                    EnvAssets.getIconPath('logout'),
                    color: _activeImage == 'logout'
                        ? GeegyColors.darkColor
                        : GeegyColors.darkGreyColor,
                  )
                      .afmPadding(
                        EdgeInsets.all(5.sp),
                      )
                      .afmPadding(
                        EdgeInsets.only(
                          left: 10.w,
                        ),
                      ),
                ),
                _activeImage == 'logout'
                    ? const TabIndicator()
                    : const SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
