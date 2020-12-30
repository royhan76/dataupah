import 'dart:convert';

List<Models> modelPublishersFromJson(String str) =>
    List<Models>.from(json.decode(str).map((x) => Models.fromJson(x)));
String modelPublishersToJson(List<Models> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Models {
  String id;
  String nama;
  String bulan;
  String tgl1;
  String tgl2;
  String tgl3;
  String tgl4;
  String total;

  Models({
    this.id,
    this.nama,
    this.bulan,
    this.tgl1,
    this.tgl2,
    this.tgl3,
    this.tgl4,
    this.total,
  });

  factory Models.fromJson(Map<String, dynamic> json) => Models(
        id: json["id"],
        nama: json["Nama"],
        bulan: json["Bulan"],
        tgl1: json["tlg1"],
        tgl2: json["tlg2"],
        tgl3: json["tlg3"],
        tgl4: json["tlg4"],
        total: json["total"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "Nama": nama,
        "Bulan": bulan,
        "tlg1": tgl1,
        "tlg2": tgl2,
        "tlg3": tgl3,
        "tlg4": tgl4,
        "total": total,
      };
}
