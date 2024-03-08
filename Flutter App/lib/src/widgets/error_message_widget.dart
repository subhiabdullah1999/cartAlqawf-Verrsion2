import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoori_ecommerce/src/data/data_storage_service.dart';
import '../utils/app_theme_data.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    final storage = Get.put(StorageService());
    return Center(
      child: Text(
        message,
        style: AppThemeData.addAddressTextStyle_13.copyWith(
            fontFamily: storage.languageCode == "ar"
                ? "Cairo Medium"
                : "Poppins Medium",
            color: Colors.black),
      ),
    );
  }
}
