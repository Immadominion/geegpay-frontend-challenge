import 'package:flutter/material.dart';
import 'package:geegpay_afrique/core/constants/env_colors.dart';

class DashboardSearch extends StatefulWidget {
  const DashboardSearch({super.key});

  @override
  State<DashboardSearch> createState() => _DashboardSearchState();
}

class _DashboardSearchState extends State<DashboardSearch> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 700,
      width: 1000,
      decoration: BoxDecoration(
        color: GeegyColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
