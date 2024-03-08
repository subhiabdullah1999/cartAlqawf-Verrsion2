import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoori_ecommerce/src/data/data_storage_service.dart';
import '../utils/app_theme_data.dart';
import '../utils/responsive.dart';

class ButtonWidget extends StatelessWidget {
  final String? buttonTittle;
  const ButtonWidget({Key? key, this.buttonTittle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storage = Get.put(StorageService());
    return Container(
      alignment: Alignment.center,
      height: 48.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              spreadRadius: 2,
              blurRadius: 10,
              color: AppThemeData.buttonShadowColor.withOpacity(0.3),
              offset: const Offset(0, 5))
        ],
        color: AppThemeData.buttonColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
      child: Text(
        buttonTittle!,
        style: isMobile(context)
            ? AppThemeData.buttonTextStyle_14.copyWith(
                fontFamily: storage.languageCode == "ar"
                    ? "Cairo Medium"
                    : "Poppins Medium")
            : AppThemeData.buttonTextStyle_11Tab.copyWith(
                fontFamily: storage.languageCode == "ar"
                    ? "Cairo Medium"
                    : "Poppins Medium"),
      ),
    );
  }
}
