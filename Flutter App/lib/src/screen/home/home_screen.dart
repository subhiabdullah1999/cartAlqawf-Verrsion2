import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yoori_ecommerce/src/_route/routes.dart';
import 'package:yoori_ecommerce/src/data/data_storage_service.dart';
import 'package:yoori_ecommerce/src/models/home_data_model.dart';
import 'package:yoori_ecommerce/src/utils/images.dart';
import '../../controllers/cart_content_controller.dart';
import '../../controllers/details_screen_controller.dart';
import '../../controllers/home_screen_controller.dart';
import '../../controllers/dashboard_controller.dart';
import '../../screen/drawer/drawer_screen.dart';
import '../../screen/news/all_news_screen.dart';
import 'package:yoori_ecommerce/src/utils/app_tags.dart';
import '../../utils/app_theme_data.dart';
import 'package:yoori_ecommerce/src/utils/responsive.dart';
import '../../widgets/product_card_widgets/home_product_card.dart';
import '../../widgets/loader/shimmer_home_content.dart';
import '../../widgets/shop_card_widget.dart';
import 'campaign/all_campaign_screen.dart';
import 'campaign/campaign_screen.dart';
import 'category/all_product_screen.dart';
import 'category/all_shop_screen.dart';
import 'category/best_selling_products_screen.dart';
import 'category/best_shop_screen.dart';
import 'category/flash_sales_screen.dart';
import 'category/offer_ending_product_screen.dart';
import 'category/product_by_brand_screen.dart';
import 'category/product_by_category_screen.dart';
import 'category/product_by_shop_screen.dart';
import 'category/recent_view_product_screen.dart';
import 'category/today_deals_screen.dart';
import 'category/top_shop_screen.dart';
import 'video_shopping/all_video_shopping.dart';

class HomeScreenContent extends StatelessWidget {
  HomeScreenContent({Key? key}) : super(key: key);
  final DashboardController homeScreenController =
      Get.find<DashboardController>();
  final _cartController = Get.find<CartContentController>();
  final homeScreenContentController = Get.find<HomeScreenController>();
  final storage = Get.put(StorageService());
  final detailsPageController = Get.lazyPut(
    () => DetailsPageController(),
    fenix: true,
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => homeScreenContentController.homeDataModel.value.data != null &&
              _cartController.addToCartListModel.data != null
          ? Scaffold(
              extendBodyBehindAppBar: false,
              appBar: isMobile(context)
                  ? AppBar(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      // leading: Builder(
                      //   builder: (BuildContext context) {
                      //     return IconButton(
                      //       icon: SvgPicture.asset(
                      //         Images.menuBar,
                      //         height: 20.h,
                      //       ),
                      //       tooltip: MaterialLocalizations.of(context)
                      //           .openAppDrawerTooltip,
                      //       onPressed: () {
                      //         Scaffold.of(context).openDrawer();
                      //         homeScreenContentController
                      //             .isVisibleUpdate(false);
                      //       },
                      //     );
                      //   },
                      // ),
                      title: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.searchProduct);
                        },
                        child: Container(
                            //width: 2,
                            height: 35.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: AppThemeData.boxShadowColor
                                      .withOpacity(0.10),
                                  spreadRadius: 0,
                                  blurRadius: 5.r,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: SvgPicture.asset(
                                    Images.searchBar,
                                    color: AppThemeData.searchIconColor,
                                    width: 18.w,
                                    height: 18.h,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 8.h),
                                  child: const VerticalDivider(
                                    thickness: 2,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Text(AppTags.searchProduct.tr,
                                      style: AppThemeData.hintTextStyle_13
                                          .copyWith(
                                              fontFamily:
                                                  storage.languageCode == "ar"
                                                      ? "Cairo Medium"
                                                      : "Poppins Medium")),
                                )
                              ],
                            )),
                      ),
                      actions: [
                        IconButton(
                          icon: SvgPicture.asset(
                            Images.notification,
                            height: 22.h,
                            width: 19.w,
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.notificationContent);
                          },
                        ),
                      ],
                    )
                  : AppBar(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      toolbarHeight: 60.h,
                      leadingWidth: 40.w,
                      // leading: Builder(
                      //   builder: (BuildContext context) {
                      //     return IconButton(
                      //       icon: SvgPicture.asset(
                      //         Images.menuBar,
                      //         height: 20.h,
                      //       ),
                      //       tooltip: MaterialLocalizations.of(context)
                      //           .openAppDrawerTooltip,
                      //       onPressed: () {
                      //         Scaffold.of(context).openDrawer();
                      //         homeScreenContentController
                      //             .isVisibleUpdate(false);
                      //       },
                      //     );
                      //   },
                      // ),
                      title: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.searchProduct);
                        },
                        child: Container(
                            height: isMobile(context) ? 35.h : 35.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: AppThemeData.boxShadowColor
                                      .withOpacity(0.10),
                                  spreadRadius: 0,
                                  blurRadius: 5.r,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: SvgPicture.asset(
                                    Images.searchBar,
                                    color: AppThemeData.searchIconColor,
                                    width: 18.w,
                                    height: 18.h,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 8.h),
                                  child: const VerticalDivider(
                                    thickness: 2,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Text(AppTags.searchProduct.tr,
                                      style: AppThemeData.hintTextStyle_10Tab
                                          .copyWith(
                                              fontFamily:
                                                  storage.languageCode == "ar"
                                                      ? "Cairo Medium"
                                                      : "Poppins Medium")),
                                )
                              ],
                            )),
                      ),
                      actions: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.w),
                          child: IconButton(
                            icon: SvgPicture.asset(
                              Images.notification,
                              height: 22.h,
                              width: 19.w,
                            ),
                            onPressed: () {
                              Get.toNamed(Routes.notificationContent);
                            },
                          ),
                        ),
                      ],
                    ),
              // drawer: const DrawerScreen(),
              body: RefreshIndicator(
                onRefresh: homeScreenContentController.getHomeDataFromServer,
                child: homeScreenContentController.isLoadingFromServer.value
                    ? const ShimmerHomeContent()
                    : Column(
                        children: [
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: double.infinity,
                              height: 50,
                              color: Colors.amber[50],
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Delivery to".tr,
                                    style: TextStyle(
                                        fontFamily: storage.languageCode == "ar"
                                            ? "Cairo Medium"
                                            : "Poppins Medium"),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    homeScreenContentController.userAdress ==
                                            null
                                        ? "everywhere".tr
                                        : homeScreenContentController
                                            .userAdress!,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontFamily: storage.languageCode == "ar"
                                            ? "Cairo Medium"
                                            : "Poppins Medium"),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              )),
                          Expanded(
                            child: SizedBox(
                              height: size.height,
                              width: double.infinity,
                              child: ListView.builder(
                                shrinkWrap: true,
                                //itemExtent: 2000,
                                physics: const BouncingScrollPhysics(),
                                itemCount: homeScreenContentController
                                    .homeDataModel.value.data!.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return Obx(() => categoryCheck(
                                      homeScreenContentController
                                          .homeDataModel.value,
                                      index,
                                      context));
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            )
          : const ShimmerHomeContent(),
    );
  }

  //Top Category
  Widget topCategories(topCategoriesIndex, context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                AppTags.topCategories.tr,
                style: isMobile(context)
                    ? AppThemeData.headerTextStyle.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium")
                    : AppThemeData.headerTextStyleTab.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium"),
              ),
            ),
            InkWell(
              onTap: () {
                homeScreenController.changeTabIndex(1);
              },
              child: Padding(
                padding: EdgeInsets.all(15.0.r),
                child: SvgPicture.asset(
                  Images.more,
                  height: 4.h,
                  width: 18.w,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 150.h,
          child: ListView.builder(
            padding: EdgeInsets.only(right: 15.w),
            physics: const BouncingScrollPhysics(),
            itemCount: homeScreenContentController.homeDataModel.value
                .data![topCategoriesIndex].topCategories!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 0.w, left: 15.w),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ProductByCategory(
                          id: homeScreenContentController
                              .homeDataModel
                              .value
                              .data![topCategoriesIndex]
                              .topCategories![index]
                              .id!,
                          title: homeScreenContentController
                              .homeDataModel
                              .value
                              .data![topCategoriesIndex]
                              .topCategories![index]
                              .title,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 150.h,
                    width: isMobile(context) ? 105.w : 80.w,
                    decoration: BoxDecoration(
                      color: AppThemeData.homeMultipleColor[
                              index % AppThemeData.homeMultipleColor.length]
                          .withOpacity(0.1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(7.r),
                      ),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xFFEEEEEE),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: CachedNetworkImage(
                              imageUrl: homeScreenContentController
                                  .homeDataModel
                                  .value
                                  .data![topCategoriesIndex]
                                  .topCategories![index]
                                  .image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 3.h),
                          child: Text(
                            homeScreenContentController
                                .homeDataModel
                                .value
                                .data![topCategoriesIndex]
                                .topCategories![index]
                                .title!
                                .toString(),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: AppThemeData.todayDealTitleStyle.copyWith(
                                fontFamily: storage.languageCode == "ar"
                                    ? "Cairo Medium"
                                    : "Poppins Medium"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }

  //Popular Categories
  Widget popularCategories(popularCategoriesIndex, context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                AppTags.popularCategories.tr,
                style: isMobile(context)
                    ? AppThemeData.headerTextStyle.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium")
                    : AppThemeData.headerTextStyleTab.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium"),
              ),
            ),
            InkWell(
              onTap: () {
                homeScreenController.changeTabIndex(1);
              },
              child: Padding(
                padding: EdgeInsets.all(15.r),
                child: SvgPicture.asset(
                  Images.more,
                  height: 4.h,
                  width: 18.w,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        SizedBox(
          height: 130.h,
          child: ListView.builder(
            padding: EdgeInsets.only(right: 15.w),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: homeScreenContentController.homeDataModel.value
                .data![popularCategoriesIndex].popularCategories!.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ProductByCategory(
                        id: homeScreenContentController
                            .homeDataModel
                            .value
                            .data![popularCategoriesIndex]
                            .popularCategories![index]
                            .id!,
                        title: homeScreenContentController
                            .homeDataModel
                            .value
                            .data![popularCategoriesIndex]
                            .popularCategories![index]
                            .title!,
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: Column(
                        children: [
                          Container(
                            width: 60.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppThemeData.homeMultipleColor[index %
                                      AppThemeData.homeMultipleColor.length]
                                  .withOpacity(0.1),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.5.r),
                              child: homeScreenContentController
                                      .homeDataModel
                                      .value
                                      .data![popularCategoriesIndex]
                                      .popularCategories![index]
                                      .icon!
                                      .isEmpty
                                  ? const SizedBox()
                                  : Icon(
                                      MdiIcons.fromString(
                                        homeScreenContentController
                                            .homeDataModel
                                            .value
                                            .data![popularCategoriesIndex]
                                            .popularCategories![index]
                                            .icon!
                                            .substring(8),
                                      ),
                                      size: 32.r,
                                      color: AppThemeData.homeMultipleColor[
                                          index %
                                              AppThemeData
                                                  .homeMultipleColor.length],
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            width: 58.w,
                            child: Text(
                              homeScreenContentController
                                  .homeDataModel
                                  .value
                                  .data![popularCategoriesIndex]
                                  .popularCategories![index]
                                  .title
                                  .toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: isMobile(context)
                                  ? AppThemeData.titleTextStyle_13.copyWith(
                                      fontFamily: storage.languageCode == "ar"
                                          ? "Cairo Medium"
                                          : "Poppins Medium")
                                  : AppThemeData.titleTextStyleTab.copyWith(
                                      fontFamily: storage.languageCode == "ar"
                                          ? "Cairo Medium"
                                          : "Poppins Medium"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Categories
  Widget _categories(categoryIndex, context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Container(
        height: isMobile(context) ? 230.h : 250.h,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                height: 228,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1),
                  padding: EdgeInsets.only(left: 6.w),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: homeScreenContentController.homeDataModel.value
                      .data![categoryIndex].categories!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ProductByCategory(
                                id: homeScreenContentController
                                    .homeDataModel
                                    .value
                                    .data![categoryIndex]
                                    .categories![index]
                                    .id,
                                title: homeScreenContentController
                                    .homeDataModel
                                    .value
                                    .data![categoryIndex]
                                    .categories![index]
                                    .title,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 4.h,
                          ),
                          child: SizedBox(
                            child: SizedBox(
                              width: 70,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      // color: Colors.grey,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          homeScreenContentController
                                              .homeDataModel
                                              .value
                                              .data![categoryIndex]
                                              .categories![index]
                                              .image!
                                              .toString(),
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    // backgroundColor: AppThemeData
                                    //     .homeMultipleColor[index %
                                    //         AppThemeData
                                    //             .homeMultipleColor.length]
                                    //     .withOpacity(0.1),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: Text(
                                      homeScreenContentController
                                          .homeDataModel
                                          .value
                                          .data![categoryIndex]
                                          .categories![index]
                                          .title
                                          .toString(),
                                      style: isMobile(context)
                                          ? AppThemeData.categoryTextStyle_14
                                              .copyWith(
                                                  fontFamily:
                                                      storage.languageCode ==
                                                              "ar"
                                                          ? "Cairo Medium"
                                                          : "Poppins Medium")
                                          : AppThemeData
                                              .categoryTitleTextStyle_12
                                              .copyWith(
                                                  fontFamily:
                                                      storage.languageCode ==
                                                              "ar"
                                                          ? "Cairo Medium"
                                                          : "Poppins Medium"),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // Row(
            //   children: [
            //     Padding(
            //       padding:
            //           EdgeInsets.only(left: isMobile(context) ? 15.w : 10.w),
            //       child: Container(
            //         height: 15.h,
            //         width: 1.5.w,
            //         color: Colors.grey,
            //         margin: EdgeInsets.only(
            //           top: 0.h,
            //           bottom: 0.h,
            //         ),
            //       ),
            //     ),
            //     InkWell(
            //       onTap: () {
            //         homeScreenController.changeTabIndex(1);
            //       },
            //       child: Padding(
            //         padding: EdgeInsets.symmetric(
            //           horizontal: isMobile(context) ? 15.w : 10.w,
            //           vertical: 0.h,
            //         ),
            //         child: SvgPicture.asset(
            //           Images.subMenu,
            //           height: 12.h,
            //           width: 12.w,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  //Popular Brands
  Widget popularBrands(brandIndex, context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                AppTags.popularBrands.tr,
                style: isMobile(context)
                    ? AppThemeData.headerTextStyle.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium")
                    : AppThemeData.headerTextStyleTab.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium"),
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.allBrand);
              },
              child: Padding(
                padding: EdgeInsets.all(15.r),
                child: SvgPicture.asset(
                  Images.more,
                  height: 4.h,
                  width: 18.w,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: isMobile(context) ? 0.h : 8.h,
        ),
        SizedBox(
          height: 150.h,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 15.w, bottom: 15.h),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: homeScreenContentController
                .homeDataModel.value.data![brandIndex].popularBrands!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ProductByBrand(
                          id: homeScreenContentController.homeDataModel.value
                              .data![brandIndex].popularBrands![index].id!,
                          title: homeScreenContentController.homeDataModel.value
                              .data![brandIndex].popularBrands![index].title!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 140.h,
                    width: isMobile(context) ? 110.w : 70.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppThemeData.boxShadowColor.withOpacity(0.05),
                          spreadRadius: 0,
                          blurRadius: 30.r,
                          offset:
                              const Offset(0, 15), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: homeScreenContentController
                              .homeDataModel
                              .value
                              .data![brandIndex]
                              .popularBrands![index]
                              .thumbnail!,
                          fit: BoxFit.cover,
                        ),
                        const Spacer(),
                        Container(
                          height: 30,
                          color: const Color.fromARGB(255, 151, 32, 23),
                          child: Center(
                            child: Text(
                              homeScreenContentController.homeDataModel.value
                                  .data![brandIndex].popularBrands![index].title
                                  .toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: storage.languageCode == "ar"
                                      ? "Cairo Medium"
                                      : "Poppins Medium"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  //Slider
  Widget slider(sliderIndex, context) {
    return homeScreenContentController
            .homeDataModel.value.data![sliderIndex].slider!.isEmpty
        ? const SizedBox()
        : Stack(
            children: [
              CarouselSlider(
                carouselController: homeScreenContentController.controller,
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    homeScreenContentController.currentUpdate(index);
                  },
                  height: isMobile(context) ? 150.h : 150.h,
                  autoPlayInterval: const Duration(seconds: 6),
                  viewportFraction: isMobile(context) ? 0.92 : 0.58,
                  aspectRatio: 16 / 4,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                ),
                items: homeScreenContentController
                    .homeDataModel.value.data![sliderIndex].slider!
                    .map(
                      (item) => Container(
                        //height:100,
                        alignment: Alignment.center,
                        // margin: const EdgeInsets.all(0.0),
                        child: Stack(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                if (item.actionType == "product") {
                                  Get.toNamed(
                                    Routes.detailsPage,
                                    parameters: {
                                      'productId': item.id!.toString(),
                                    },
                                  );
                                } else if (item.actionType == "category") {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => ProductByCategory(
                                        id: item.id!,
                                        title: item.title.toString(),
                                      ),
                                    ),
                                  );
                                } else if (item.actionType == "brand") {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => ProductByBrand(
                                        id: item.id!,
                                        title: "Brand",
                                      ),
                                    ),
                                  );
                                } else if (item.actionType == "seller") {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => ProductByShop(
                                        id: item.id!,
                                        shopName: "Shop",
                                      ),
                                    ),
                                  );
                                } else if (item.actionType == "url") {
                                  Get.toNamed(
                                    Routes.wvScreen,
                                    parameters: {
                                      'url': item.actionTo.toString(),
                                      'title': "",
                                    },
                                  );
                                } else if (item.actionType == "blog") {
                                  Get.toNamed(
                                    Routes.newsScreen,
                                    parameters: {
                                      'title': item.title.toString(),
                                      'url': item.url.toString(),
                                      'image': item.backgroundImage.toString(),
                                    },
                                  );
                                }
                              },
                              child: SizedBox(
                                height: 150.h,
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.r),
                                  child: CachedNetworkImage(
                                    imageUrl: item.banner!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              Positioned(
                bottom: isMobile(context) ? 0.h : 5.h,
                left: 0.w,
                right: 0.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: homeScreenContentController
                      .homeDataModel.value.data![sliderIndex].slider!
                      .asMap()
                      .entries
                      .map(
                    (entry) {
                      return GestureDetector(
                        onTap: () {
                          homeScreenContentController.controller
                              .animateToPage(entry.key);
                          homeScreenContentController.currentUpdate(entry.key);
                        },
                        child: Obx(
                          () => Container(
                            width: homeScreenContentController.current.value ==
                                    entry.key
                                ? 20.0.w
                                : 10.w,
                            height: 3.0.h,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 4.w),
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.r)),
                              color:
                                  homeScreenContentController.current.value ==
                                          entry.key
                                      ? const Color(0xff333333)
                                      : const Color(0xff999999),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          );
  }

  //Banner
  Widget banner(bannerIndex, context) {
    return Padding(
      padding: EdgeInsets.only(top: isMobile(context) ? 10.h : 30.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            // height: isMobile(context) ? 90.h : 110.h,
            width: double.infinity,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, mainAxisExtent: 190),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(right: 0.w),
              scrollDirection: Axis.vertical,
              itemCount: homeScreenContentController
                  .homeDataModel.value.data![bannerIndex].banners!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    var data = homeScreenContentController
                        .homeDataModel.value.data![bannerIndex].banners![index];
                    if (data.actionType == "product") {
                      if (data.actionId != "") {
                        Get.toNamed(
                          Routes.detailsPage,
                          parameters: {
                            'productId': data.actionId!,
                          },
                        );
                      }
                    } else if (data.actionType == "category") {
                      if (data.actionId!.isNotEmpty) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ProductByCategory(
                              id: int.parse(data.actionId!),
                              title: data.actionTo.toString(),
                            ),
                          ),
                        );
                      }
                    } else if (data.actionType == "brand") {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ProductByBrand(
                            id: int.parse(data.actionId!),
                            title: data.actionTo.toString(),
                          ),
                        ),
                      );
                    } else if (data.actionType == "seller") {
                      Get.toNamed(
                        Routes.shopScreen,
                        parameters: {
                          'shopId': data.actionId!,
                        },
                      );
                    } else if (data.actionType == "url") {
                      Get.toNamed(
                        Routes.wvScreen,
                        parameters: {
                          'url': data.actionId.toString(),
                          'title': data.actionTo.toString(),
                        },
                      );
                    } else if (data.actionType == "blog") {
                      Get.toNamed(
                        Routes.newsScreen,
                        parameters: {
                          'title': data.actionTo.toString(),
                          'url': data.actionId.toString(),
                          'image': data.thumbnail.toString(),
                        },
                      );
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 10.w),
                    child: Container(
                      width: 159.w,
                      height: 190,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                                homeScreenContentController
                                    .homeDataModel
                                    .value
                                    .data![bannerIndex]
                                    .banners![index]
                                    .thumbnail!
                                    .toString())),
                        borderRadius: BorderRadius.all(Radius.circular(15.r)),
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 14.h),
        ],
      ),
    );
  }

  //Category Banner
  Widget categorySecBanner(catSecIndex, context) {
    return SizedBox(
        height: 100.h,
        child: Padding(
          padding:
              EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h, bottom: 10.h),
          child: Container(
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  homeScreenContentController
                      .homeDataModel.value.data![catSecIndex].categorySecBanner
                      .toString(),
                ),
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppThemeData.boxShadowColor.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 10.r,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
          ),
        ));
  }

  //Offer Ending Banner
  Widget offerEndingBanner(offerEndingIndex, context) {
    return SizedBox(
      height: 100.h,
      child: Padding(
        padding:
            EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h, bottom: 10.h),
        child: Container(
          width: MediaQuery.of(context).size.width - 30,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                homeScreenContentController
                    .homeDataModel.value.data![offerEndingIndex].offerEnding
                    .toString(),
              ),
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppThemeData.boxShadowColor.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 10.r,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Campaign
  Widget campaign(campaignIndex, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                AppTags.campaign.tr,
                style: isMobile(context)
                    ? AppThemeData.headerTextStyle.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium")
                    : AppThemeData.headerTextStyleTab.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium"),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => const AllCampaign());
              },
              child: Padding(
                padding: EdgeInsets.all(15.r),
                child: SvgPicture.asset(
                  Images.more,
                  height: 4.h,
                  width: 18.w,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        SizedBox(
          height: isMobile(context) ? 100.h : 120.h,
          child: ListView.builder(
            padding: EdgeInsets.only(right: 15.w),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: homeScreenContentController
                .homeDataModel.value.data![campaignIndex].campaigns!.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CampaignContentScreen(
                        campainId: homeScreenContentController.homeDataModel
                            .value.data![campaignIndex].campaigns![index].id!,
                        title: homeScreenContentController.homeDataModel.value
                            .data![campaignIndex].campaigns![index].title!,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Container(
                    width: isMobile(context) ? 165.w : 140.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          homeScreenContentController.homeDataModel.value
                              .data![campaignIndex].campaigns![index].banner!
                              .toString(),
                        ),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 14.h),
      ],
    );
  }

  // Featured Shop
  Widget featuredShop(featureShopIndex, context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                AppTags.featuredShop.tr,
                style: isMobile(context)
                    ? AppThemeData.headerTextStyle.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium")
                    : AppThemeData.headerTextStyleTab.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium"),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => const AllShop());
              },
              child: Padding(
                padding: EdgeInsets.all(15.r),
                child: SvgPicture.asset(
                  Images.more,
                  height: 4.h,
                  width: 18.w,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: isMobile(context) ? 230.h : 260.h,
          child: ListView.builder(
            padding: EdgeInsets.only(right: 15.w),
            itemCount: homeScreenContentController.homeDataModel.value
                .data![featureShopIndex].featuredShops!.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed(
                    Routes.shopScreen,
                    parameters: {
                      'shopId': homeScreenContentController.homeDataModel.value
                          .data![featureShopIndex].featuredShops![index].id!
                          .toString(),
                    },
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 0.w, left: 15.w),
                  child: ShopCardWidget(
                    shop: homeScreenContentController.homeDataModel.value
                        .data![featureShopIndex].featuredShops![index],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  //Express Shop
  Widget expressShop(expressShopIndex, context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                AppTags.expressShop.tr,
                style: isMobile(context)
                    ? AppThemeData.headerTextStyle.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium")
                    : AppThemeData.headerTextStyleTab.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium"),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => const AllShop());
              },
              child: Padding(
                padding: EdgeInsets.all(15.r),
                child: SvgPicture.asset(
                  Images.more,
                  height: 4.h,
                  width: 18.w,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: isMobile(context) ? 230.h : 260.h,
          child: ListView.builder(
            padding: EdgeInsets.only(right: 15.w),
            itemCount: homeScreenContentController.homeDataModel.value
                .data![expressShopIndex].expressShops!.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed(
                    Routes.shopScreen,
                    parameters: {
                      'shopId': homeScreenContentController.homeDataModel.value
                          .data![expressShopIndex].expressShops![index].id!
                          .toString(),
                    },
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 0.w, left: 15.w),
                  child: ShopCardWidget(
                    shop: homeScreenContentController.homeDataModel.value
                        .data![expressShopIndex].expressShops![index],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Best Shop
  Widget bestShop(bestShopIndex, context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                AppTags.bestShop.tr,
                style: isMobile(context)
                    ? AppThemeData.headerTextStyle.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium")
                    : AppThemeData.headerTextStyleTab.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium"),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => const BestShop());
              },
              child: Padding(
                padding: EdgeInsets.all(15.r),
                child: SvgPicture.asset(
                  Images.more,
                  height: 4.h,
                  width: 18.w,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: isMobile(context) ? 230.h : 260.h,
          child: ListView.builder(
            padding: EdgeInsets.only(right: 15.w),
            itemCount: homeScreenContentController
                .homeDataModel.value.data![bestShopIndex].bestShops!.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed(
                    Routes.shopScreen,
                    parameters: {
                      'shopId': homeScreenContentController.homeDataModel.value
                          .data![bestShopIndex].bestShops![index].id!
                          .toString(),
                    },
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: ShopCardWidget(
                    shop: homeScreenContentController.homeDataModel.value
                        .data![bestShopIndex].bestShops![index],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  //Top Shop
  Widget topShop(sellersIndex, context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                AppTags.topShop.tr,
                style: isMobile(context)
                    ? AppThemeData.headerTextStyle.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium")
                    : AppThemeData.headerTextStyleTab.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium"),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => const TopShop());
              },
              child: Padding(
                padding: EdgeInsets.all(15.r),
                child: SvgPicture.asset(
                  Images.more,
                  height: 4.h,
                  width: 18.w,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: isMobile(context) ? 230.h : 260.h,
          child: ListView.builder(
            padding: EdgeInsets.only(right: 15.w),
            itemCount: homeScreenContentController
                .homeDataModel.value.data![sellersIndex].topShops!.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed(
                    Routes.shopScreen,
                    parameters: {
                      'shopId': homeScreenContentController.homeDataModel.value
                          .data![sellersIndex].topShops![index].id!
                          .toString(),
                    },
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 0.w, left: 15.w),
                  child: ShopCardWidget(
                    shop: homeScreenContentController.homeDataModel.value
                        .data![sellersIndex].topShops![index],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  //Latest News
  Widget latestNews(latestNewsIndex, context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.to(AllNews());
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  AppTags.latestNews.tr,
                  style: isMobile(context)
                      ? AppThemeData.headerTextStyle.copyWith(
                          fontFamily: storage.languageCode == "ar"
                              ? "Cairo Medium"
                              : "Poppins Medium")
                      : AppThemeData.headerTextStyleTab.copyWith(
                          fontFamily: storage.languageCode == "ar"
                              ? "Cairo Medium"
                              : "Poppins Medium"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.r),
                child: SvgPicture.asset(
                  Images.more,
                  height: 4.h,
                  width: 18.w,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 220.h,
          child: ListView.builder(
            padding: EdgeInsets.only(right: 15.w),
            itemCount: homeScreenContentController
                .homeDataModel.value.data![latestNewsIndex].latestNews!.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed(
                    Routes.newsScreen,
                    parameters: {
                      'title': homeScreenContentController.homeDataModel.value
                          .data![latestNewsIndex].latestNews![index].title!,
                      'url': homeScreenContentController.homeDataModel.value
                          .data![latestNewsIndex].latestNews![index].url!,
                      'image': homeScreenContentController.homeDataModel.value
                          .data![latestNewsIndex].latestNews![index].thumbnail!
                    },
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 0.w, left: 15.w),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 200.h,
                        width: isMobile(context) ? 165.w : 130.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(7.r)),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  AppThemeData.boxShadowColor.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 10.r,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: CachedNetworkImageProvider(
                                      homeScreenContentController
                                          .homeDataModel
                                          .value
                                          .data![latestNewsIndex]
                                          .latestNews![index]
                                          .thumbnail!,
                                    ),
                                  ),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 4.w, bottom: 4.h, top: 4.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      homeScreenContentController
                                          .homeDataModel
                                          .value
                                          .data![latestNewsIndex]
                                          .latestNews![index]
                                          .title!,
                                      style: isMobile(context)
                                          ? AppThemeData.titleTextStyle_14
                                              .copyWith(
                                                  fontFamily:
                                                      storage.languageCode ==
                                                              "ar"
                                                          ? "Cairo Medium"
                                                          : "Poppins Medium")
                                          : AppThemeData.titleTextStyle_11Tab
                                              .copyWith(
                                                  fontFamily:
                                                      storage.languageCode ==
                                                              "ar"
                                                          ? "Cairo Medium"
                                                          : "Poppins Medium"),
                                      maxLines: 1,
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      homeScreenContentController
                                          .homeDataModel
                                          .value
                                          .data![latestNewsIndex]
                                          .latestNews![index]
                                          .shortDescription!,
                                      style: isMobile(context)
                                          ? AppThemeData.qsTextStyle_12
                                              .copyWith(
                                                  fontFamily: storage
                                                              .languageCode ==
                                                          "ar"
                                                      ? "Cairo Medium"
                                                      : "Poppins Medium")
                                          : AppThemeData.qsTextStyle_9Tab
                                              .copyWith(
                                                  fontFamily:
                                                      storage.languageCode ==
                                                              "ar"
                                                          ? "Cairo Medium"
                                                          : "Poppins Medium"),
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  //Today Deal
  Widget todayDeal(todayDealIndex, context) {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    String time = "24:00:00";
    String date = "$formattedDate $time";
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Text(
                    AppTags.todayDeal.tr,
                    style: isMobile(context)
                        ? AppThemeData.headerTextStyle.copyWith(
                            fontFamily: storage.languageCode == "ar"
                                ? "Cairo Medium"
                                : "Poppins Medium")
                        : AppThemeData.headerTextStyleTab.copyWith(
                            fontFamily: storage.languageCode == "ar"
                                ? "Cairo Medium"
                                : "Poppins Medium"),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                CountdownTimer(
                  endTime: DateTime.now().millisecondsSinceEpoch +
                      DateTime.parse(date)
                          .difference(DateTime.now())
                          .inMilliseconds,
                  widgetBuilder: (_, time) {
                    if (time == null) {
                      return Center(
                        child: Text(
                          'Over',
                          style: isMobile(context)
                              ? AppThemeData.timeDateTextStyle_12.copyWith(
                                  fontFamily: storage.languageCode == "ar"
                                      ? "Cairo Medium"
                                      : "Poppins Medium")
                              : AppThemeData.timeDateTextStyleTab.copyWith(
                                  fontFamily: storage.languageCode == "ar"
                                      ? "Cairo Medium"
                                      : "Poppins Medium"),
                        ),
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: isMobile(context) ? 30.w : 20.w,
                            height: isMobile(context) ? 20.h : 23.h,
                            decoration: BoxDecoration(
                              color: const Color(0xff333333),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 30.r,
                                  blurRadius: 5.r,
                                  color: AppThemeData.boxShadowColor
                                      .withOpacity(0.01),
                                  offset: const Offset(0, 15),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "${time.hours ?? 0}".padLeft(2, '0'),
                                style: isMobile(context)
                                    ? AppThemeData.timeDateTextStyle_12
                                        .copyWith(
                                            fontFamily:
                                                storage.languageCode == "ar"
                                                    ? "Cairo Medium"
                                                    : "Poppins Medium")
                                    : AppThemeData.timeDateTextStyleTab
                                        .copyWith(
                                            fontFamily:
                                                storage.languageCode == "ar"
                                                    ? "Cairo Medium"
                                                    : "Poppins Medium"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Container(
                            width: isMobile(context) ? 30.w : 20.w,
                            height: isMobile(context) ? 20.h : 23.h,
                            decoration: BoxDecoration(
                              color: const Color(0xff333333),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.r),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 30.r,
                                  blurRadius: 5.r,
                                  color: AppThemeData.boxShadowColor
                                      .withOpacity(0.01),
                                  offset: const Offset(0, 15),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "${time.min ?? 0}".padLeft(2, '0'),
                                style: isMobile(context)
                                    ? AppThemeData.timeDateTextStyle_12
                                        .copyWith(
                                            fontFamily:
                                                storage.languageCode == "ar"
                                                    ? "Cairo Medium"
                                                    : "Poppins Medium")
                                    : AppThemeData.timeDateTextStyleTab
                                        .copyWith(
                                            fontFamily:
                                                storage.languageCode == "ar"
                                                    ? "Cairo Medium"
                                                    : "Poppins Medium"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Container(
                            width: isMobile(context) ? 30.w : 20.w,
                            height: isMobile(context) ? 20.h : 23.h,
                            decoration: BoxDecoration(
                              color: const Color(0xff333333),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.r),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 30.r,
                                  blurRadius: 5.r,
                                  color: AppThemeData.boxShadowColor
                                      .withOpacity(0.01),
                                  offset: const Offset(0, 15),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "${time.sec ?? 0}".padLeft(2, '0'),
                                style: isMobile(context)
                                    ? AppThemeData.timeDateTextStyle_12
                                        .copyWith(
                                            fontFamily:
                                                storage.languageCode == "ar"
                                                    ? "Cairo Medium"
                                                    : "Poppins Medium")
                                    : AppThemeData.timeDateTextStyleTab
                                        .copyWith(
                                            fontFamily:
                                                storage.languageCode == "ar"
                                                    ? "Cairo Medium"
                                                    : "Poppins Medium"),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                )
              ],
            ),
            InkWell(
              onTap: () {
                Get.to(() => const TodayDeal());
              },
              child: Padding(
                padding: EdgeInsets.all(15.r),
                child: SvgPicture.asset(
                  Images.more,
                  height: 4.h,
                  width: 18.w,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: isMobile(context) ? 0.h : 8.h,
        ),
        SizedBox(
          height: 255.h,
          child: ListView.builder(
            padding: EdgeInsets.only(right: 15.w),
            itemCount: homeScreenContentController
                .homeDataModel.value.data![todayDealIndex].todayDeals!.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: HomeProductCard(
                  dataModel: homeScreenContentController
                      .homeDataModel.value.data![todayDealIndex].todayDeals,
                  index: index,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  //Offer Ending
  Widget offerEnding(offerEndingIndex, context) {
    return Column(
      children: [
        const SizedBox(
          height: 0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                AppTags.offerEnding.tr,
                style: isMobile(context)
                    ? AppThemeData.headerTextStyle.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium")
                    : AppThemeData.headerTextStyleTab.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium"),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => const OfferEndingProductsView());
              },
              child: Padding(
                padding: EdgeInsets.all(15.r),
                child: SvgPicture.asset(
                  Images.more,
                  height: 4.h,
                  width: 18.w,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 255.h,
          child: ListView.builder(
            padding: EdgeInsets.only(right: 15.w),
            itemCount: homeScreenContentController.homeDataModel.value
                .data![offerEndingIndex].offerEnding!.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Column(
                  children: [
                    HomeProductCard(
                      dataModel: homeScreenContentController.homeDataModel.value
                          .data![offerEndingIndex].offerEnding,
                      index: index,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  //Flash Sale
  Widget flashSale(flashProductsIndex, context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                AppTags.flashSale.tr,
                style: isMobile(context)
                    ? AppThemeData.headerTextStyle.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium")
                    : AppThemeData.headerTextStyleTab.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium"),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => const FlashSales());
              },
              child: Padding(
                padding: EdgeInsets.all(15.0.r),
                child: SvgPicture.asset(
                  Images.more,
                  height: 4.h,
                  width: 18.w,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        SizedBox(
          height: 255.h,
          child: ListView.builder(
            padding: EdgeInsets.only(right: 15.w),
            itemCount: homeScreenContentController.homeDataModel.value
                        .data![flashProductsIndex].flashDeals !=
                    null
                ? homeScreenContentController.homeDataModel.value
                    .data![flashProductsIndex].flashDeals!.length
                : 0,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 0.w, left: 15.w),
                child: Column(
                  children: [
                    HomeProductCard(
                      dataModel: homeScreenContentController.homeDataModel.value
                          .data![flashProductsIndex].flashDeals,
                      index: index,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  //Recent Product
  Widget recentViewProducts(recentViewProductsIndex, context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Text(
                AppTags.recentView.tr,
                style: isMobile(context)
                    ? AppThemeData.headerTextStyle.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium")
                    : AppThemeData.headerTextStyleTab.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium"),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => const RecentViewProduct());
              },
              child: Padding(
                padding: EdgeInsets.all(15.r),
                child: SvgPicture.asset(
                  Images.more,
                  height: 4.h,
                  width: 18.w,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        SizedBox(
          height: 255.h,
          child: ListView.builder(
            padding: EdgeInsets.only(right: 15.w),
            itemCount: homeScreenContentController.homeDataModel.value
                .data![recentViewProductsIndex].recentViewedProduct!.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Column(
                  children: [
                    HomeProductCard(
                      dataModel: homeScreenContentController.homeDataModel.value
                          .data![recentViewProductsIndex].recentViewedProduct,
                      index: index,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  //Custom Product
  Widget customProducts(customIndex, context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                AppTags.customProduct.tr,
                style: isMobile(context)
                    ? AppThemeData.headerTextStyle.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium")
                    : AppThemeData.headerTextStyleTab.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium"),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => const AllProductView());
              },
              child: Padding(
                padding: EdgeInsets.all(15.r),
                child: SvgPicture.asset(
                  Images.more,
                  height: 4.h,
                  width: 18.w,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        SizedBox(
          height: 255.h,
          child: ListView.builder(
            padding: EdgeInsets.only(right: 15.w),
            itemCount: homeScreenContentController
                .homeDataModel.value.data![customIndex].customProducts!.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Column(
                  children: [
                    HomeProductCard(
                      dataModel: homeScreenContentController.homeDataModel.value
                          .data![customIndex].customProducts,
                      index: index,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  //Latest Product
  Widget latestProducts(latestProductsIndex, context) {
    return Container(
      color: const Color(0xFF9e5252),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  AppTags.latestProducts.tr,
                  style: isMobile(context)
                      ? AppThemeData.headerTextStyle.copyWith(
                          fontFamily: storage.languageCode == "ar"
                              ? "Cairo Medium"
                              : "Poppins Medium")
                      : AppThemeData.headerTextStyleTab.copyWith(
                          fontFamily: storage.languageCode == "ar"
                              ? "Cairo Medium"
                              : "Poppins Medium"),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const AllProductView());
                },
                child: Padding(
                  padding: EdgeInsets.all(15.r),
                  child: SvgPicture.asset(
                    Images.more,
                    height: 4.h,
                    width: 18.w,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          SizedBox(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.63),
              padding: EdgeInsets.only(right: 15.w),
              itemCount: homeScreenContentController.homeDataModel.value
                  .data![latestProductsIndex].latestProducts!.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      HomeProductCard(
                        dataModel: homeScreenContentController.homeDataModel
                            .value.data![latestProductsIndex].latestProducts,
                        index: index,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  //Best Selling Product
  Widget bestSellingProduct(bestSellingProductIndex, context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                AppTags.bestSellingProducts.tr,
                style: isMobile(context)
                    ? AppThemeData.headerTextStyle.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium")
                    : AppThemeData.headerTextStyleTab.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium"),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => const BestSellingProductsView());
              },
              child: Padding(
                padding: EdgeInsets.all(15.r),
                child: SvgPicture.asset(
                  Images.more,
                  height: 4.h,
                  width: 18.w,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Container(
          padding: const EdgeInsets.only(bottom: 15),
          color: const Color(0xFF9e5252),
          child: SizedBox(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.63),
              padding: EdgeInsets.only(right: 15.w),
              itemCount: homeScreenContentController.homeDataModel.value
                  .data![bestSellingProductIndex].bestSellingProducts!.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 15.w, top: 20),
                  child: Column(
                    children: [
                      HomeProductCard(
                        dataModel: homeScreenContentController
                            .homeDataModel
                            .value
                            .data![bestSellingProductIndex]
                            .bestSellingProducts,
                        index: index,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // Widget bestSellingProduct(bestSellingProductIndex, context) {
  //   return Column(
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 15.w),
  //             child: Text(
  //               AppTags.bestSellingProducts.tr,
  //               style: isMobile(context)
  //                   ? AppThemeData.headerTextStyle
  //                   : AppThemeData.headerTextStyleTab,
  //             ),
  //           ),
  //           InkWell(
  //             onTap: () {
  //               Get.to(() => const BestSellingProductsView());
  //             },
  //             child: Padding(
  //               padding: EdgeInsets.all(15.r),
  //               child: SvgPicture.asset(
  //                 Images.more,
  //                 height: 4.h,
  //                 width: 18.w,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //       SizedBox(height: 4.h),
  //       SizedBox(
  //         height: 255.h,
  //         child: ListView.builder(
  //           padding: EdgeInsets.only(right: 15.w),
  //           itemCount: homeScreenContentController.homeDataModel.value
  //               .data![bestSellingProductIndex].bestSellingProducts!.length,
  //           scrollDirection: Axis.horizontal,
  //           physics: const BouncingScrollPhysics(),
  //           itemBuilder: (context, index) {
  //             return Padding(
  //               padding: EdgeInsets.only(left: 15.w),
  //               child: Column(
  //                 children: [
  //                   HomeProductCard(
  //                     dataModel: homeScreenContentController.homeDataModel.value
  //                         .data![bestSellingProductIndex].bestSellingProducts,
  //                     index: index,
  //                   ),
  //                 ],
  //               ),
  //             );
  //           },
  //         ),
  //       ),
  //     ],
  //   );
  // }

  //Video Shopping
  Widget videoShopping(videoShoppingIndex, context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                AppTags.videoShopping.tr,
                style: isMobile(context)
                    ? AppThemeData.headerTextStyle.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium")
                    : AppThemeData.headerTextStyleTab.copyWith(
                        fontFamily: storage.languageCode == "ar"
                            ? "Cairo Medium"
                            : "Poppins Medium"),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => const AllVideoShopping());
              },
              child: Padding(
                padding: EdgeInsets.all(15.r),
                child: SvgPicture.asset(
                  Images.more,
                  height: 4.h,
                  width: 18.w,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: isMobile(context) ? 150.h : 220.h,
          child: ListView.builder(
            padding: EdgeInsets.only(right: 15.w),
            itemCount: homeScreenContentController.homeDataModel.value
                .data![videoShoppingIndex].videoShopping!.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed(
                    Routes.detailsVideoShopping,
                    parameters: {
                      'videoSlug': homeScreenContentController
                          .homeDataModel
                          .value
                          .data![videoShoppingIndex]
                          .videoShopping![index]
                          .slug
                          .toString(),
                    },
                  );
                },
                child: Padding(
                    padding: EdgeInsets.only(right: 0.w, left: 15.w),
                    child: SizedBox(
                      //height: 120.h,
                      width: 105.w,

                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      homeScreenContentController
                                          .homeDataModel
                                          .value
                                          .data![videoShoppingIndex]
                                          .videoShopping![index]
                                          .thumbnail
                                          .toString()),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          isMobile(context)
                              ? Positioned(
                                  child: SvgPicture.asset(Images.playVideo))
                              : Positioned(
                                  child: SvgPicture.asset(Images.playVideo,
                                      height: 35.h)),
                          Positioned(
                            top: 5.h,
                            left: 10.w,
                            child: Text(
                              "LIVE",
                              style: isMobile(context)
                                  ? AppThemeData.todayDealNewStyle.copyWith(
                                      fontFamily: storage.languageCode == "ar"
                                          ? "Cairo Medium"
                                          : "Poppins Medium")
                                  : AppThemeData.todayDealNewStyleTab.copyWith(
                                      fontFamily: storage.languageCode == "ar"
                                          ? "Cairo Medium"
                                          : "Poppins Medium"),
                            ),
                          ),
                          Positioned(
                            bottom: 5.h,
                            left: 3.w,
                            right: 3.w,
                            child: Text(
                              homeScreenContentController
                                  .homeDataModel
                                  .value
                                  .data![videoShoppingIndex]
                                  .videoShopping![index]
                                  .title
                                  .toString(),
                              style: isMobile(context)
                                  ? AppThemeData.timeDateTextStyle_12.copyWith(
                                      fontFamily: storage.languageCode == "ar"
                                          ? "Cairo Medium"
                                          : "Poppins Medium")
                                  : AppThemeData.timeDateTextStyleTab.copyWith(
                                      fontFamily: storage.languageCode == "ar"
                                          ? "Cairo Medium"
                                          : "Poppins Medium"),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    )),
              );
            },
          ),
        ),
      ],
    );
  }

  categoryCheck(HomeDataModel data, index, context) {
    switch (data.data![index].sectionType) {
      case "categories":
        return _categories(index, context);
      case 'slider':
        return slider(index, context);
      case 'benefits':
        return const SizedBox();
      case 'popular_categories':
        return popularCategories(index, context);
      case 'banners':
        return banner(index, context);
      case 'campaigns':
        return campaign(index, context);
      case 'top_categories':
        return topCategories(index, context);
      case 'today_deals':
        return todayDeal(index, context);
      case 'flash_deals':
        return flashSale(index, context);
      case 'category_sec_banner':
        //return categorySecBanner(index, context);
        return const SizedBox();
      case 'category_sec_banner_url':
        return const SizedBox();
      case 'category_section':
        return const SizedBox();
      case 'best_selling_products':
        return bestSellingProduct(index, context);
      case 'offer_ending':
        return offerEnding(index, context);
      case 'offer_ending_banner':
        // return offerEndingBanner(index, context);
        return const SizedBox();
      case 'offer_ending_banner_url':
        return const SizedBox();
      case 'latest_products':
        return latestProducts(index, context);
      case 'latest_news':
        return latestNews(index, context);
      case 'popular_brands':
        return popularBrands(index, context);
      case 'best_shops':
        return bestShop(index, context);
      case 'top_shops':
        return topShop(index, context);
      case 'featured_shops':
        return featuredShop(index, context);
      case 'express_shops':
        return expressShop(index, context);
      case 'recent_viewed_product':
        return recentViewProducts(index, context);
      case 'custom_products':
        return customProducts(index, context);
      case 'subscription_section':
        return const SizedBox();
      case 'video_shopping':
        return videoShopping(index, context);
      default:
        return const SizedBox();
    }
  }
}
