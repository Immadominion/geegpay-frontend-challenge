import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geegpay_afrique/core/extensions/color_extension.dart';
import 'package:geegpay_afrique/presentation/views/dashboard/dashboard.dart';

void main() {
  runApp(const GeegyApp());
}

class GeegyApp extends StatelessWidget {
  const GeegyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final PageStorageBucket bucket = PageStorageBucket();
    return ScreenUtilInit(
      designSize: const Size(1440, 960),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Geegpay',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: '#BB372F'.toColor(),
            ),
            useMaterial3: true,
          ),
          home: PageStorage(
            bucket: bucket,
            child: const GeegyDashBoard(),
          ),
        );
      },
    );
  }
}
