import 'package:challenge_it_flutter/app/models/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LocationMarker extends Marker {
  LocationMarker({required this.loc})
      : super(
          anchorPos: AnchorPos.align(AnchorAlign.top),
          height: 25,
          width: 25,
          point: LatLng(loc.latitude!, loc.longitude!),
          builder: (BuildContext ctx) => Icon(
            Icons.store_mall_directory_sharp,
            color: Colors.red,
          ),
        );

  final Location loc;
}
