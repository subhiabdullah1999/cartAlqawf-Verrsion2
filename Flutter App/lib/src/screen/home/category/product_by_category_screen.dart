import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:yoori_ecommerce/src/controllers/category_content_controller.dart';
import 'package:yoori_ecommerce/src/data/data_storage_service.dart';
import '../../../controllers/home_screen_controller.dart';
import '../../../models/product_by_category_model.dart';
import '../../../utils/app_theme_data.dart';
import 'package:yoori_ecommerce/src/utils/responsive.dart';
import '../../../widgets/product_card_widgets/category_product_card.dart';
import '../../../servers/repository.dart';
import '../../../utils/app_tags.dart';
import '../../../widgets/loader/shimmer_load_data.dart';
import '../../../widgets/loader/shimmer_products.dart';

class ProductByCategory extends StatefulWidget {
  ProductByCategory({
    Key? key,
    required this.id,
    this.title,
  }) : super(key: key);
  int? id;
  final String? title;

  @override
  State<ProductByCategory> createState() => _ProductByCategoryState();
}

class _ProductByCategoryState extends State<ProductByCategory> {
  final homeController = Get.put(HomeScreenController());
  final _catController = Get.put(CategoryContentController());
  final storage = Get.put(StorageService());

  int page = 0;
  GlobalKey<PaginationViewState> key = GlobalKey<PaginationViewState>();
  late List<CategoryProductData> data = [];

  Future<List<CategoryProductData>> getData(int offset) async {
    page++;
    return await Repository()
        .getProductByCategoryItem(id: widget.id, page: page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 243, 243),
      appBar: isMobile(context)
          ? AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              centerTitle: true,
              title: Text(
                widget.title.toString(),
                style: AppThemeData.headerTextStyle_16.copyWith(
                    fontFamily: storage.languageCode == "ar"
                        ? "Cairo Medium"
                        : "Poppins Medium"),
              ),
            )
          : AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 60.h,
              leadingWidth: 40.w,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 25.r,
                ),

                onPressed: () {
                  Get.back();
                }, // null disables the button
              ),
              centerTitle: true,
              title: Text(
                widget.title.toString(),
                style: AppThemeData.headerTextStyle_14.copyWith(
                    fontFamily: storage.languageCode == "ar"
                        ? "Cairo Medium"
                        : "Poppins Medium"),
              ),
            ),
      body: ListView(
        children: [
          GetBuilder<CategoryContentController>(
            builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              height: 40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _catController
                      .categoryList[_catController.index.value]
                      .subCategories!
                      .length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        widget.id = _catController
                            .categoryList[_catController.index.value]
                            .subCategories![index]
                            .id;
                        // key = GlobalKey<PaginationViewState>();

                        page = 0;

                        // getData(widget.id!);
                        // key.currentState?.refresh();

                        Navigator.of(context).pushReplacement(PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  ProductByCategory(
                            id: widget.id,
                            title: _catController
                                .categoryList[_catController.index.value]
                                .subCategories![index]
                                .title,
                          ),
                          transitionDuration: const Duration(milliseconds: 0),
                          opaque: true,
                        ));
                        // Navigator.of(context).pushReplacement(
                        //   MaterialPageRoute(
                        //     builder: (_) => ProductByCategory(
                        //       id: widget.id,
                        //       title: _catController
                        //           .categoryList[_catController.index.value]
                        //           .subCategories![index]
                        //           .title,
                        //     ),
                        //   ),
                        // );

                        controller.indexsubcat = index;
                        controller.updateVal();
                        print("idddddddddddddddddddddddddf");
                        print(widget.id);
                        print("idddddddddddddddddddddddddf");
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        height: 20,
                        // width: 75,
                        decoration: BoxDecoration(
                            color: controller.indexsubcat == index
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            _catController
                                .categoryList[_catController.index.value]
                                .subCategories![index]
                                .title
                                .toString(),
                            style: isMobile(context)
                                ? AppThemeData.priceTextStyle_14.copyWith(
                                    fontFamily: storage.languageCode == "ar"
                                        ? "Cairo Medium"
                                        : "Poppins Medium")
                                : AppThemeData.titleTextStyle_11Tab.copyWith(
                                    fontFamily: storage.languageCode == "ar"
                                        ? "Cairo Medium"
                                        : "Poppins Medium"),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          GetBuilder<CategoryContentController>(
            builder: (controller) => _catController.isLoading == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : PaginationView<CategoryProductData>(
                    key: key,
                    paginationViewType: PaginationViewType.gridView,
                    pageFetch: getData,
                    pullToRefresh: false,
                    onError: (dynamic error) => Center(
                      child: Text(AppTags.somethingWentWrong.tr),
                    ),
                    onEmpty: Center(
                      child: Text(AppTags.noProduct.tr),
                    ),
                    bottomLoader: const ShimmerLoadData(),
                    initialLoader: const ShimmerProducts(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile(context) ? 2 : 3,
                      childAspectRatio: 0.63,
                      // mainAxisSpacing: isMobile(context) ? 7 : 12,
                      // crossAxisSpacing: isMobile(context) ? 7 : 12,
                    ),
                    itemBuilder: (BuildContext context,
                        CategoryProductData product, int index) {
                      return CategoryProductCard(
                        dataModel: product,
                        index: index,
                      );
                    },
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                    shrinkWrap: true,
                  ),
          )
        ],
      ),
    );
  }
}
