// To parse this JSON data, do
//
//     final responseGetBarang = responseGetBarangFromJson(jsonString);

import 'dart:convert';

ResponseGetBarang responseGetBarangFromJson(String str) => ResponseGetBarang.fromJson(json.decode(str));

String responseGetBarangToJson(ResponseGetBarang data) => json.encode(data.toJson());

class ResponseGetBarang {
  ResponseGetBarang({
    this.pesan,
    this.sukses,
    this.barang,
  });

  String pesan;
  bool sukses;
  List<Barang> barang;

  factory ResponseGetBarang.fromJson(Map<String, dynamic> json) => ResponseGetBarang(
    pesan: json["pesan"],
    sukses: json["sukses"],
    barang: List<Barang>.from(json["barang"].map((x) => Barang.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pesan": pesan,
    "sukses": sukses,
    "barang": List<dynamic>.from(barang.map((x) => x.toJson())),
  };
}

class Barang {
  Barang({
    this.barangId,
    this.barangNama,
    this.barangJumlah,
    this.barangGambar,
  });

  String barangId;
  String barangNama;
  String barangJumlah;
  String barangGambar;

  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
    barangId: json["barang_id"],
    barangNama: json["barang_nama"],
    barangJumlah: json["barang_jumlah"],
    barangGambar: json["barang_gambar"],
  );

  Map<String, dynamic> toJson() => {
    "barang_id": barangId,
    "barang_nama": barangNama,
    "barang_jumlah": barangJumlah,
    "barang_gambar": barangGambar,
  };
}
