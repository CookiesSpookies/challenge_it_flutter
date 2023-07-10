class Location {
  int? id;
  String? namaCabang;
  String? alamat;
  double? latitude;
  double? longitude;
  
  Location({
    this.id,
    this.namaCabang,
    this.alamat,
    this.latitude,
    this.longitude
  });

  //function to convert json data to user model
  factory Location.fromJson(Map<String, dynamic> json){
    return Location(
      id: json['id'],
      namaCabang: json['nama_cabang'],
      alamat: json['alamat'],
      latitude: double.parse(json['latitude'].toString().replaceAll(',', '.')),
      longitude: double.parse(json['longitude'].toString().replaceAll(',', '.')),
    );
  }
}