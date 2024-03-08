import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:yoori_ecommerce/src/_route/routes.dart';
import 'package:yoori_ecommerce/src/data/data_storage_service.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../utils/app_tags.dart';
import '../../../utils/app_theme_data.dart';

class RechargeConfirmationScreen extends StatelessWidget {
  RechargeConfirmationScreen({Key? key}) : super(key: key);
  final homeScreenController = Get.find<DashboardController>();
  final storage = Get.put(StorageService());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppTags.confirmation.tr,
          style: AppThemeData.headerTextStyle_16.copyWith(
              fontFamily: storage.languageCode == "ar"
                  ? "Cairo Medium"
                  : "Poppins Medium"),
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 126.h,
                    width: 126.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      image: const DecorationImage(
                        alignment: Alignment.center,
                        matchTextDirection: true,
                        repeat: ImageRepeat.noRepeat,
                        image: AssetImage("assets/images/successful.gif"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Text(
                    AppTags.successfulPayment.tr,
                    style: AppThemeData.seccessfulPayTextStyle_18.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium"),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    AppTags.thankYouForRecharge.tr,
                    style: AppThemeData.titleTextStyle_14.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium"),
                  ),
                  SizedBox(
                    height: 50.h,
                  )
                ],
              ),
            ),
            //Calculate Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48.h,
                      child: ElevatedButton(
                        onPressed: () {
                          homeScreenController.changeTabIndex(4);
                          Get.offAllNamed(Routes.dashboardScreen);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppThemeData.buttonShadowColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          AppTags.goToProfile.tr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
                            fontFamily: storage.languageCode == "ar"
                                ? "Cairo Medium"
                                : "Poppins Medium",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            )
          ],
        ),
      ),
    );
  }
}
