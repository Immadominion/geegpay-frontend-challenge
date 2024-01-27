import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geegpay_afrique/core/constants/env_assets.dart';
import 'package:geegpay_afrique/core/constants/env_colors.dart';
import 'package:geegpay_afrique/core/constants/env_strings.dart';
import 'package:geegpay_afrique/core/constants/format_cash.dart';
import 'package:geegpay_afrique/core/extensions/widget_extension.dart';
import 'package:geegpay_afrique/presentation/views/dashboard/dash_mini_container_section.dart';
import 'package:geegpay_afrique/presentation/views/dashboard/dash_search_widget.dart';
import 'package:geegpay_afrique/presentation/views/dashboard/dash_top_platform_widget.dart';
import 'package:geegpay_afrique/presentation/views/dashboard/dashboard_widgets.dart';
import 'package:geegpay_afrique/presentation/views/dashboard/side_menu.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'dashboard_lists_repo.dart';
import 'last_order_body.dart';
import 'last_order_heading.dart';

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
  bool seeAllLastOrders = false;
  bool seeAllPlatforms = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width > 1300) {
      removeSpan = false;
    } else {
      removeSpan = true;
    }
    return Scaffold(
      backgroundColor: GeegyColors.greyColor,
      body: Row(
        children: [
          Expanded(
            flex: removeSpan ? 0 : 1,
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (removeSpan) {
                  return const SizedBox();
                } else {
                  return const SideBarDesktop();
                }
              },
            ),
          ),
          Expanded(
            flex: removeSpan ? 1 : 18,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
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
              body: Column(
                children: [
                  Divider(
                    height: 0.5,
                    thickness: 0.5,
                    color: GeegyColors.darkGreyColor,
                    // endIndent: 10.sp,
                    //indent: 10.sp,
                  ),
                  removeSpan
                      ? const SizedBox()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 375.h,
                                  width: 730.w,
                                  decoration: BoxDecoration(
                                    color: GeegyColors.whiteColor,
                                  ),
                                ).afmBorderRadius(
                                  BorderRadius.circular(
                                    20.r,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MiniContainer(),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        Container(
                                          height: 175.h,
                                          width: 280.w,
                                          decoration: BoxDecoration(
                                            color: GeegyColors.whiteColor,
                                          ),
                                        ).afmBorderRadius(
                                          BorderRadius.circular(
                                            20.r,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),

                                    ///Second row below the first row of two containers
                                    Row(
                                      children: [
                                        Container(
                                          height: 175.h,
                                          width: 280.w,
                                          decoration: BoxDecoration(
                                            color: GeegyColors.whiteColor,
                                          ),
                                        ).afmBorderRadius(
                                          BorderRadius.circular(
                                            20.r,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        Container(
                                          height: 175.h,
                                          width: 280.w,
                                          decoration: BoxDecoration(
                                            color: GeegyColors.whiteColor,
                                          ),
                                        ).afmBorderRadius(
                                          BorderRadius.circular(
                                            20.r,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ///This is the last orders container
                                Container(
                                  height: 375.h,
                                  width: 730.w,
                                  padding: EdgeInsets.all(20.sp),
                                  decoration: BoxDecoration(
                                    color: GeegyColors.whiteColor,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                seeAllLastOrders =
                                                    !seeAllLastOrders;
                                              });
                                            },
                                            child: seeAllLastOrders
                                                ? Row(
                                                    children: [
                                                      Icon(
                                                        Icons.close,
                                                        size: 15.sp,
                                                      ).afmPadding(
                                                        EdgeInsets.only(
                                                            right: 5.w),
                                                      ),
                                                      Text(
                                                        GeegyStrings.clAll,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15.sp,
                                                          color: GeegyColors
                                                              .warningColor,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Text(
                                                    GeegyStrings.seeAll,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15.sp,
                                                      color: GeegyColors
                                                          .primaryColor,
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
                                                  color:
                                                      GeegyColors.darkGreyColor,
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
                                ),

                                ///This is the container that contains top platforms
                                Container(
                                  height: 375.h,
                                  width: 575.w,
                                  padding: EdgeInsets.all(20.sp),
                                  decoration: BoxDecoration(
                                    color: GeegyColors.whiteColor,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                seeAllPlatforms =
                                                    !seeAllPlatforms;
                                              });
                                            },
                                            child: seeAllPlatforms
                                                ? Row(
                                                    children: [
                                                      Icon(
                                                        Icons.close,
                                                        size: 15.sp,
                                                      ).afmPadding(
                                                        EdgeInsets.only(
                                                            right: 5.w),
                                                      ),
                                                      Text(
                                                        GeegyStrings.clAll,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15.sp,
                                                          color: GeegyColors
                                                              .warningColor,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Text(
                                                    GeegyStrings.seeAll,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15.sp,
                                                      color: GeegyColors
                                                          .primaryColor,
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
                                                    platformName:
                                                        platformNameList[index],
                                                    price: formatDollarBalance(
                                                      platformPriceList[index],
                                                      noShowNaira: false,
                                                    ),
                                                    percent:
                                                        platformPercentageDoubles[
                                                            index],
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
                                ),
                              ],
                            ),
                          ],
                        ).afmPadding(
                          EdgeInsets.all(20.sp),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
