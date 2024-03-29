import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yoori_ecommerce/src/data/data_storage_service.dart';
import 'package:yoori_ecommerce/src/utils/images.dart';
import '../../controllers/dashboard_controller.dart';
import '../../screen/cart/cart_screen.dart';
import '../../screen/category/category_screen.dart';
import '../../utils/app_theme_data.dart';
import '../../controllers/cart_content_controller.dart';
import '../favorite/favorites_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  final homeController = Get.find<DashboardController>();
  final cartContentController = Get.put(CartContentController());
  final storage = Get.put(StorageService());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: homeController.tabIndex.value,
          children: [
            HomeScreenContent(),
            CategoryScreen(),
            const CartScreen(),
            FavoritesScreen(),
            const ProfileContent()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          backgroundColor: Colors.white,
          selectedFontSize: 12.r,
          onTap: homeController.changeTabIndex,
          currentIndex: homeController.tabIndex.value,
          selectedItemColor: AppThemeData.buttonColor,
          selectedLabelStyle: TextStyle(
              color: AppThemeData.headlineTextColor,
              fontFamily: storage.languageCode == "ar"
                  ? "Cairo Medium"
                  : "Poppins Medium"),
          elevation: 5.0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                activeIcon: _bottomNavIconBuilder(
                    isSelected: homeController.tabIndex.value == 0,
                    logo: "i_icon",
                    height: 25.w,
                    width: 25.h,
                    label: "home".tr),
                icon: _bottomNavIconBuilder(
                    isSelected: homeController.tabIndex.value == 0,
                    logo: "i_icon",
                    height: 21.h,
                    width: 21.w,
                    label: "home".tr),
                label: "Home",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                activeIcon: _bottomNavIconBuilder(
                    isSelected: homeController.tabIndex.value == 1,
                    logo: "category",
                    height: 25.h,
                    width: 25.w,
                    label: "Category".tr),
                icon: _bottomNavIconBuilder(
                    isSelected: homeController.tabIndex.value == 1,
                    logo: "category",
                    height: 21.h,
                    width: 21.w,
                    label: "Category".tr),
                label: "Category",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                activeIcon: _bottomNavIconBuilder(
                    isSelected: homeController.tabIndex.value == 2,
                    logo: "cart_",
                    height: 25.h,
                    width: 25.w,
                    isCart: true,
                    label: "cart".tr),
                icon: _bottomNavIconBuilder(
                    isSelected: homeController.tabIndex.value == 2,
                    logo: "cart_",
                    height: 21.h,
                    width: 21.w,
                    isCart: true,
                    label: "cart".tr),
                label: "Cart",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                activeIcon: _bottomNavIconBuilder(
                    isSelected: homeController.tabIndex.value == 3,
                    logo: "heart_bar",
                    height: 25.h,
                    width: 25.w,
                    label: "Favorite".tr),
                icon: _bottomNavIconBuilder(
                    isSelected: homeController.tabIndex.value == 3,
                    logo: "heart_bar",
                    height: 21.h,
                    width: 21.w,
                    label: "Favorite".tr),
                label: "Favorite",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
              activeIcon: _bottomNavIconBuilder(
                  isSelected: homeController.tabIndex.value == 4,
                  logo: "profile_",
                  height: 25.h,
                  width: 25.w,
                  label: "Profile".tr),
              icon: _bottomNavIconBuilder(
                  isSelected: homeController.tabIndex.value == 4,
                  logo: "profile_",
                  height: 21.h,
                  width: 21.w,
                  label: "Profile".tr),
              label: "Profile",
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavIconBuilder({
    required bool isSelected,
    required String logo,
    required String label,
    required double height,
    required double width,
    bool isCart = false,
  }) {
    return Column(
      children: [
        isCart
            ? Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: badges.Badge(
                  animationDuration: const Duration(milliseconds: 300),
                  animationType: badges.BadgeAnimationType.slide,
                  badgeContent: Text(
                    cartContentController.addToCartListModel.data != null
                        ? cartContentController
                                    .addToCartListModel.data!.carts !=
                                null
                            ? cartContentController
                                .addToCartListModel.data!.carts!.length
                                .toString()
                            : "0"
                        : "0",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 9.sp,
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium"),
                  ),
                  child: SvgPicture.asset(
                    Images.cart,
                    width: width,
                    height: height,
                  ),
                ),
              )
            : SizedBox(
                height: 35.h,
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/$logo.svg",
                    height: height,
                    width: width,
                  ),
                ),
              ),
        Text(label)
      ],
    );
  }
}
