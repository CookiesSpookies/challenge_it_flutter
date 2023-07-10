class LocationATM {
  int? id;
  String? namaATM;
  double? latitude;
  double? longitude;
  
  LocationATM({
    this.id,
    this.namaATM,
    this.latitude,
    this.longitude
  });

  //function to convert json data to user model
  factory LocationATM.fromJson(Map<String, dynamic> json){
    return LocationATM(
      id: json['id'],
      namaATM: json['nama_atm'],
      latitude: double.parse(json['latitude'].toString().replaceAll(',', '.')),
      longitude: double.parse(json['longitude'].toString().replaceAll(',', '.')),
    );
  }
}