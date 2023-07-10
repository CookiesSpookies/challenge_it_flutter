import 'package:challenge_it_flutter/app/constants/widget.dart';
import 'package:challenge_it_flutter/app/models/LocationATMMarker.dart';
import 'package:challenge_it_flutter/app/models/LocationMarker.dart';
import 'package:challenge_it_flutter/app/models/location.dart';
import 'package:challenge_it_flutter/app/models/locationATM.dart';
import 'package:challenge_it_flutter/app/views/home/home_controller.dart';
import 'package:challenge_it_flutter/app/views/home/location_atm_popup.dart';
import 'package:challenge_it_flutter/app/views/home/location_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.white),
                  children: [
                    TextSpan(text: 'Map Distribusi Cabang ( '),
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Icon(Icons.store_mall_directory_sharp,color: Colors.red,),
                      ),
                    ),
                    TextSpan(text: ' ) dan ATM ('),
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Icon(Icons.atm_sharp,color: Colors.blue,),
                      ),
                    ),
                    TextSpan(text: ' )'),
                  ],
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 32, 37, 63),
              centerTitle: true,
            ),
            body: Obx(() => controller.loading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : FlutterMap(
                    options: MapOptions(
                      center: controller.indo,
                      zoom: 5,
                      maxZoom: 15,
                      onTap: (_, __) =>
                          controller.popupLayerController.hideAllPopups(),
                      onPositionChanged: (_, __) =>
                          controller.popupLayerController.hideAllPopups(),
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        subdomains: ['a', 'b', 'c'],
                      ),
                      PopupMarkerLayer(
                        options: PopupMarkerLayerOptions(
                          popupController: controller.popupLayerController,
                          markers: <Marker>[
                            for (LocationATM locATM in controller.locationATMs)
                              LocationATMMarker(locATM: locATM),
                            for (Location loc in controller.locations)
                              LocationMarker(loc: loc)
                          ],
                          popupDisplayOptions: PopupDisplayOptions(
                            builder: (_, Marker marker) {
                              if (marker is LocationMarker) {
                                return LocationMarkerPopup(
                                  loc: marker.loc,
                                  key: marker.key,
                                );
                              } else if (marker is LocationATMMarker) {
                                controller.getOneKilometer(
                                    marker.locATM.latitude!,
                                    marker.locATM.longitude!);
                                return LocationATMMarkerPopup(
                                  locATM: marker.locATM,
                                  key: marker.key,
                                  oneKilometer: controller.oneKilometer,
                                );
                              }
                              return const Card(child: Text('Not a monument'));
                            },
                          ),
                        ),
                      ),
                    ],
                  ))));
  }
}
