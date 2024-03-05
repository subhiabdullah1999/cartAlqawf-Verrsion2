import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:yoori_ecommerce/src/models/edit_view_model.dart';
import 'package:yoori_ecommerce/src/models/home_data_model.dart';
import 'package:yoori_ecommerce/src/data/local_data_helper.dart';
import 'package:yoori_ecommerce/src/servers/repository.dart';

class HomeScreenController extends GetxController implements GetxService {
  PageController pageController = PageController();
  final CarouselController controller = CarouselController();
  var current = 1.obs;
  bool isVisible = true;
  var index = 2;
  bool isFavourite = false;
  Rx<HomeDataModel> homeDataModel = HomeDataModel().obs;
  var isLoadingFromServer = false.obs;
  String? userAdress;

  Position? position;
  updatUi() {
    update();
  }

  Future<HomeDataModel> getHomeScreenData() async {
    HomeDataModel? data = LocalDataHelper().getHomeData();
    if (data != null) {
      homeDataModel.value = data;
    }
    await Repository().getHomeScreenData().then(
      (homeData) {
        homeDataModel.value = homeData;
        LocalDataHelper().saveHomeContent(homeData);
      },
    );
    return homeDataModel.value;
  }

  Future<HomeDataModel> getHomeDataFromServer() async {
    isLoadingFromServer(true);
    return await Repository().getHomeScreenData().then(
      (homeData) {
        homeDataModel.value = homeData;
        LocalDataHelper().saveHomeContent(homeData);
        isLoadingFromServer(false);
        return homeDataModel.value;
      },
    );
  }

  removeTrailingZeros(String n) {
    return n.replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
  }

  getCurentLocation() async {
    position = await Geolocator.getCurrentPosition();
    print("gggggggggyyyyyyyyy888777777777777777777");
    print(position!.latitude);
    print("gggggggggyyyyyyyyy888777777777777777777");
    getAddressFromLatLng();

    update();
  }

  Future<String> getAddressFromLatLng() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position!.latitude, position!.longitude);
    Placemark placemark = placemarks[0];
    print("y64532222222222222211-----------");
    print(placemark);
    print("y64532222222222222211-----------");
    userAdress = '  ${placemark.country}, ${placemark.locality}';

    return '  ${placemark.country}, ${placemark.locality}';
  }

  @override
  void onInit() {
    super.onInit();
    getHomeScreenData();
    getCurentLocation();
  }

  isVisibleUpdate(bool value) {
    isVisible = value;
    update();
  }

  currentUpdate(int value) {
    current.value = value;
    update();
  }

  isFavouriteUpdate() {
    isFavourite = !isFavourite;
    update();
  }
}
