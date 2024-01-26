import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geegpay_afrique/core/constants/env_assets.dart';
import 'package:geegpay_afrique/core/constants/env_colors.dart';
import 'package:geegpay_afrique/core/extensions/widget_extension.dart';
import 'package:geegpay_afrique/presentation/views/dashboard/dash_search_widget.dart';
import 'package:geegpay_afrique/presentation/views/dashboard/dashboard_widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'image_switcher.dart';

class GeegyDashBoard extends StatefulWidget {
  const GeegyDashBoard({super.key});

  @override
  State<GeegyDashBoard> createState() => _GeegyDashBoardState();
}

class _GeegyDashBoardState extends State<GeegyDashBoard> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();
  final onMenuHover = Matrix4.identity()..scale(1.0);
  final ScrollController yourScrollController = ScrollController();
  final menuItems = const <Widget>[
    //TODO: IN THIS SPACE YOU SHOULD ORDER YOUR MOBILE VIEW
    DashboardDate(),
    Placeholder(),
    Placeholder(),
  ];
  var menuIndex = 0;

  final screensList = const <Widget>[
    Placeholder(),
    Placeholder(),
  ];

  Future scrollTo({required int index}) async {
    itemScrollController
        .scrollTo(
            index: index,
            duration: const Duration(seconds: 2),
            curve: Curves.fastLinearToSlowEaseIn)
        .whenComplete(() {
      setState(() {
        menuIndex = index;
      });
    });
  }

  bool removeSpan = false;
  String _activeImage = '';
  @override
  void initState() {
    _activeImage = 'menu';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width > 1300) {
      removeSpan = false;
    } else {
      removeSpan = true;
    }
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: removeSpan ? 0 : 1,
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (removeSpan) {
                  return const SizedBox();
                } else {
                  return Container(
                    // padding: EdgeInsets.only(
                    //   left: 10.w,
                    // ),
                    decoration: BoxDecoration(
                      color: GeegyColors.appBackgroundColor,
                      border: Border(
                        right: BorderSide(
                          width: 1.sp,
                          color: GeegyColors.darkGreyColor,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                ).afmPadding(
                                  EdgeInsets.all(6.sp),
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
                                ).afmPadding(
                                  EdgeInsets.all(6.sp),
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
                                ).afmPadding(
                                  EdgeInsets.all(15.sp),
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
                                ).afmPadding(
                                  EdgeInsets.all(6.sp),
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
                                ).afmPadding(
                                  EdgeInsets.all(6.sp),
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
                                ).afmPadding(
                                  EdgeInsets.all(6.sp),
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
                                ).afmPadding(
                                  EdgeInsets.all(13.sp),
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
                                ).afmPadding(
                                  EdgeInsets.all(5.sp),
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
                                ).afmPadding(
                                  EdgeInsets.all(5.sp),
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
              },
            ),
          ),
          Expanded(
            flex: removeSpan ? 1 : 18,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: GeegyColors.appBackgroundColor,
                toolbarHeight: 130.h,
                titleSpacing: 50.w,
                elevation: 0,
                title: LayoutBuilder(
                  builder: (context, constraints) {
                    if (removeSpan) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Dashboard',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w600,
                              fontSize: 50.sp,
                            ),
                          ),
                          const Spacer(),
                          PopupMenuButton(
                            icon: Icon(
                              Icons.menu_sharp,
                              size: 32,
                              color: GeegyColors.primaryColor,
                            ),
                            color: GeegyColors.appBackgroundColor,
                            position: PopupMenuPosition.under,
                            constraints: BoxConstraints.tightFor(
                                width: size.width * 0.9),
                            itemBuilder: (BuildContext context) => menuItems
                                .asMap()
                                .entries
                                .map(
                                  (e) => PopupMenuItem(
                                    textStyle: const TextStyle(),
                                    onTap: () {
                                      scrollTo(index: e.key);
                                    },
                                    child: e.value,
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Dashboard',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                            ),
                          ),
                          const Spacer(),
                          const SearchBox(),
                          SizedBox(
                            width: 25.w,
                          ),
                          const DashboardDate(),
                          SizedBox(
                            width: 25.w,
                          ),
                          SizedBox(
                            width: 40.w,
                            child: Image.asset(
                              EnvAssets.getIconPath('bell'),
                            ),
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          const DashboardSignout(),
                          SizedBox(width: 10.sp),
                        ],
                      ).afmPadding(
                        EdgeInsets.only(
                          top: 30.h,
                        ),
                      );
                    }
                  },
                ),
              ),
              body: const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildNavBarAnimatedContainer(int index, bool hover) {
    return AnimatedContainer(
      alignment: Alignment.center,
      width: hover ? 80 : 75,
      duration: const Duration(milliseconds: 200),
      transform: hover ? onMenuHover : null,
      child: menuItems[index],
    );
  }
}

class TabIndicator extends StatelessWidget {
  const TabIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: 3.w,
      decoration: BoxDecoration(
          color: GeegyColors.darkColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.r),
            bottomLeft: Radius.circular(5.r),
          )),
    );
  }
}
