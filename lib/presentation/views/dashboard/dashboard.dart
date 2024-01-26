import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geegpay_afrique/core/constants/env_assets.dart';
import 'package:geegpay_afrique/core/constants/env_colors.dart';
import 'package:geegpay_afrique/core/extensions/widget_extension.dart';
import 'package:geegpay_afrique/presentation/views/dashboard/dashboard_widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
    DashboardSearch(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
  ];
  var menuIndex = 0;

  final screensList = const <Widget>[
    Placeholder(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
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
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width > 726) {
      removeSpan = false;
    } else {
      removeSpan = true;
    }
    return Row(
      children: [
        Expanded(
          flex: removeSpan ? 0 : 1,
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (removeSpan) {
                return const SizedBox();
              } else {
                return Container(
                  color: GeegyColors.appBackgroundColor,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200.h,
                        width: 200.w,
                        child: Image.asset(
                          EnvAssets.getIconPath('thumbnail'),
                        ).afmPadding(
                          EdgeInsets.all(20.sp),
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
          flex: removeSpan ? 1 : 17,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: GeegyColors.appBackgroundColor,
              toolbarHeight: 105.h,
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
                          constraints:
                              BoxConstraints.tightFor(width: size.width * 0.9),
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Dashboard Sys',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 30,
                          child: ListView.separated(
                            itemCount: menuItems.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, child) =>
                                const SizedBox(width: 8),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  scrollTo(index: index);
                                },
                                borderRadius: BorderRadius.circular(100),
                                onHover: (value) {
                                  setState(() {
                                    if (value) {
                                      menuIndex = index;
                                    } else {
                                      menuIndex = 0;
                                    }
                                  });
                                },
                                child: buildNavBarAnimatedContainer(
                                    index, menuIndex == index ? true : false),
                              );
                            },
                          ),
                        ),
                        //  const SizedBox(width: 30),
                      ],
                    );
                  }
                },
              ),
            ),
            body: const Placeholder(),
          ),
        ),
      ],
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
