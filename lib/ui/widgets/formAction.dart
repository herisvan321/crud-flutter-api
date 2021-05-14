import 'package:flutter/material.dart';
import 'package:belajarcrud2/core/service/ApiService.dart';
import 'package:belajarcrud2/core/models/response_action_barang.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

String cekValidasi(value) {
  if (value.isEmpty) {
    return "tidak boleh kosong";
  } else {
    return null;
  }
}

Widget formData(String id, TextEditingController nama,
    TextEditingController jumlah, TextEditingController barang, bool update) {
  final _formKey = GlobalKey<FormState>();
  bool _isSukses;
  response_action_barang responseActionBarang;

  ApiService service = ApiService();

  BuildContext context;

  void ActionData() async {
    var pesan;
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      if (update) {
        pesan = "Update";
        responseActionBarang =
            await service.updateBarang(id, nama.text, jumlah.text, barang.text);
      } else {
        pesan = "Simpan";
        responseActionBarang =
            await service.insertBarang(nama.text, jumlah.text, barang.text);
      }

      _isSukses = responseActionBarang.sukses;
      if (_isSukses) {
        Get.offAllNamed("/");
        // Toast.show("Data Berhasil ", context);
        Get.snackbar("Success", "Data Berhasil $pesan",
            backgroundColor: new Color(0xff5db362), colorText: Colors.white);
      } else {
        // Toast.show("Data Gagal ", context);
        Get.snackbar("Danger", "Data gagal $pesan",
            backgroundColor: new Color(0xffd2514d), colorText: Colors.white);
        print("gagal");
      }
    } else {
      print("hoo");
    }
  }

  return Form(
    key: _formKey,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
            controller: nama,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter Nama Barang",
              labelText: "Nama Barang",
            ),
            validator: cekValidasi,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: jumlah,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Jumlah Barang",
                labelText: "Jumlah Barang"),
            validator: cekValidasi,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: barang,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Link Gambar",
                labelText: "Link Gambar"),
            validator: cekValidasi,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ElevatedButton(
                child: Text("Submit"),
                onPressed: () {
                  ActionData();
                },
              )
            ],
          )
        ],
      ),
    ),
  );
}
