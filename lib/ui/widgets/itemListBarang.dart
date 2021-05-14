import 'package:flutter/material.dart';
import 'package:belajarcrud2/core/models/response_get_barang.dart';

Widget getCard(Barang barang) {
  return Card(
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
              child: Image.network(barang.barangGambar)
          ),
          SizedBox(width: 10,),
          Expanded(
            flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nama Barang : " + barang.barangNama),
                  Text("Jumlah Barang : " + barang.barangJumlah),
                ],
              )
          )
        ],
      ),
    ),
  );
}