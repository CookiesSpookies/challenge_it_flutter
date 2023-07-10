import 'package:challenge_it_flutter/app/models/location.dart';
import 'package:flutter/material.dart';

class LocationMarkerPopup extends StatelessWidget {
  const LocationMarkerPopup({required Key? key, required this.loc})
      : super(key: key);
  final Location loc;

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
              child: Icon(Icons.store_mall_directory_rounded,color: Colors.red),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                constraints: const BoxConstraints(minWidth: 100, maxWidth: 200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Cabang : ${loc.namaCabang}',
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                    Text('Alamat : ${loc.alamat}',
                        style: const TextStyle(fontSize: 12.0)),
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
