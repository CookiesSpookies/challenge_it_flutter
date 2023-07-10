import 'package:challenge_it_flutter/app/models/api_response.dart';
import 'package:challenge_it_flutter/app/models/locationATM.dart';
import 'package:challenge_it_flutter/app/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_marker_popup/extension_api.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'dart:math' show cos, sqrt, asin;

class HomeController extends GetxController {
  final LatLng indo = const LatLng(-0.789275, 113.921327);
  final PopupController popupLayerController = PopupController();
  var locations = <dynamic>[].obs;
  var locationATMs = <dynamic>[].obs;
  var oneKilometer = <dynamic>[].obs;
  var loading = true.obs;

  @override
  void onInit() {
    loading.value = true;
    getLocationData();
    loading.value = false;
    super.onInit();
  }

  @override
  void dispose() {
    popupLayerController.dispose();
    super.dispose();
  }

  void getLocationData() async {
    ApiResponse response = await getAllLocation();
    if (response.error == null) {
      locations.value = response.data as List<dynamic>;
      getLocationATMData();
    } else {
      Get.snackbar(
        'ERROR',
        '${response.error}',
        snackPosition: SnackPosition.TOP,
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
      );
    }
  }

  void getLocationATMData() async {
    ApiResponse response = await getAllLocationATM();
    if (response.error == null) {
      locationATMs.value = response.data as List<dynamic>;
    } else {
      Get.snackbar(
        'ERROR',
        '${response.error}',
        snackPosition: SnackPosition.TOP,
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
      );
    }
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  void getOneKilometer(double lat, double long) async {
    var km = 0.0;
    oneKilometer.clear();
      for (LocationATM loc in locationATMs) {
        km = calculateDistance(loc.latitude!, loc.longitude!, lat, long);
        if (km <= 1 && km != 0.0) {
          oneKilometer.add(loc);
        }
      }
  }
}
