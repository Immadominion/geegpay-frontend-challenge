import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geegpay_afrique/core/constants/env_assets.dart';
import 'package:geegpay_afrique/core/constants/env_colors.dart';
import 'package:geegpay_afrique/core/extensions/widget_extension.dart';
import 'package:geegpay_afrique/presentation/views/dashboard/dash_search_widget.dart';
import 'package:geegpay_afrique/presentation/views/dashboard/dash_top_platforms.dart';
import 'package:geegpay_afrique/presentation/views/dashboard/dashboard_graph.dart';
import 'package:geegpay_afrique/presentation/views/dashboard/dashboard_widgets.dart';
import 'package:geegpay_afrique/presentation/views/dashboard/last_order_screen.dart';
import 'package:geegpay_afrique/presentation/views/dashboard/side_menu.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'dashboard_mini_cooper.dart';

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
    DashboardDate(),
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
                toolbarHeight: 135.h,
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
                          const Spacer(),
                          const Spacer(),
                          const Flexible(
                            child: SearchBox(),
                          ),
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
                      ?

                      ///This is the mobile view
                      ListView(
                          children: const [
                            DashboardGraph(),
                            MiniCooper(),
                            MainLastOrder(),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DashboardGraph(),
                                MiniCooper(),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ///This is the last orders container
                                MainLastOrder(),

                                ///This is the container that contains top platforms
                                TopPlatforms(),
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
