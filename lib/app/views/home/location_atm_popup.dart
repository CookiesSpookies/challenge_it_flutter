import 'package:challenge_it_flutter/app/models/locationATM.dart';
import 'package:challenge_it_flutter/app/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationATMMarkerPopup extends GetView<HomeController> {
  const LocationATMMarkerPopup(
      {Key? key, required this.locATM, required this.oneKilometer})
      : super(key: key);
  final LocationATM locATM;
  final List<dynamic> oneKilometer;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
        mainAxisSize: MainAxisSize.min,
          children: [
             Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Icon(Icons.atm_sharp,color: Colors.blue[900]),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                constraints: const BoxConstraints(minWidth: 100, maxWidth: 200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      '${locATM.namaATM}',
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                    controller.oneKilometer.length > 0 ? const Text('ATM Terdekat :',style: const TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold)) : const Text('Tidak ada ATM terdekat',style: const TextStyle(fontSize: 10.0)),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                    for (LocationATM one in controller.oneKilometer) 
                      Text('${one.namaATM}',style: const TextStyle(fontSize: 10.0)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
