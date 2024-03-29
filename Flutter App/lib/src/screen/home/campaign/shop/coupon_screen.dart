import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoori_ecommerce/src/data/data_storage_service.dart';
import '../../../../models/visit_shop_model.dart';
import '../../../../utils/app_theme_data.dart';
import '../../../../utils/app_tags.dart';
import '../../../../utils/responsive.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({
    Key? key,
    this.visitShopModel,
  }) : super(key: key);
  final VisitShopModel? visitShopModel;

  @override
  Widget build(BuildContext context) {
    final storage = Get.put(StorageService());

    return visitShopModel!.data!.coupons!.isNotEmpty
        ? Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: ListView.builder(
              itemCount: visitShopModel!.data!.coupons!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.5.h),
                  child: Container(
                    width: double.infinity,
                    height: 120.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          visitShopModel!.data!.coupons![index].image145x110!,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30.w, bottom: 21.h),
                          child: SizedBox(
                            height: 28.h,
                            child: ElevatedButton(
                              onPressed: () {
                                Clipboard.setData(
                                  ClipboardData(
                                      text: visitShopModel!
                                          .data!.coupons![index].code!),
                                ).then(
                                  (value) => ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      content:
                                          Text(AppTags.couponCodeCopied.tr),
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 3,
                                backgroundColor: Colors.white,
                                shadowColor: AppThemeData.boxShadowColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                              child: Text(
                                AppTags.copy.tr,
                                style: TextStyle(
                                    fontSize: isMobile(context) ? 12.sp : 9.sp,
                                    color: Colors.black,
                                    fontFamily: storage.languageCode == "ar"
                                        ? "Cairo Medium"
                                        : "Poppins Medium"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        : Center(
            child: Text(AppTags.noCouponAvailable.tr,
                style: isMobile(context)
                    ? AppThemeData.headerTextStyle_16.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium")
                    : AppThemeData.headerTextStyleTab.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium")),
          );
  }
}
