import 'package:challenge_it_flutter/app/models/location.dart';
import 'package:challenge_it_flutter/app/models/locationATM.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LocationATMMarker extends Marker {
  LocationATMMarker({required this.locATM})
      : super(
          anchorPos: AnchorPos.align(AnchorAlign.top),
          height: 25,
          width: 25,
          point: LatLng(locATM.latitude!, locATM.longitude!),
          builder: (BuildContext ctx) => Icon(
            Icons.atm_sharp,
            color: Colors.blue[900],
          ),
        );

  final LocationATM locATM;
}
