import 'package:flutter/material.dart';
import 'package:geegpay_afrique/core/constants/env_colors.dart';

extension WidgetExtension on Widget {
  Widget get aftmDefaultBorderRadius => ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: this,
      );

  Widget get afmDoubleUp => Transform.scale(
        scale: 2,
        child: this,
      );

  Widget get afmCenter => Center(
        child: this,
      );

  Widget get afmNeverScroll => SingleChildScrollView(
        child: this,
      );
  Widget afmBorderRadius(BorderRadius radius) => ClipRRect(
        borderRadius: radius,
        child: this,
      );

  Widget afmGetFuture(Future<Object?>? future) => FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return this;
          } else {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
        },
      );

  Widget afmTouchable(
    VoidCallback onTap, {
    Color? splashColor,
    double? elevation,
  }) =>
      Material(
        color: Colors.transparent,
        elevation: elevation ?? 0,
        child: InkWell(
          splashColor: splashColor,
          onTap: onTap,
          child: this,
        ),
      );

  Widget afmPadding([EdgeInsetsGeometry? padding]) {
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
      child: this,
    );
  }

  Widget afmPositionCentered([context]) {
    return Positioned(
      right: MediaQuery.of(context).size.width / 2.5,
      child: this,
    );
  }

  Widget get afmWrapUp => Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: GeegyColors.primaryColor,
        ),
        child: this,
      );
}
