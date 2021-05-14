import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:belajarcrud2/core/models/response_action_barang.dart';
import 'package:belajarcrud2/core/models/response_get_barang.dart';

class ApiService{
   static final String _url = "http://192.168.100.7/server_inventory/index.php/api";


   static Future<List<Barang>> getBarang() async {
      List<Barang> listBarang = [];
      final response = await http.get(Uri.parse('$_url/getbarang'));

      if(response.statusCode == 200){
         final json = jsonDecode(response.body);
         ResponseGetBarang responseGetBarang = ResponseGetBarang.fromJson(json);
         responseGetBarang.barang.forEach((item) {
            listBarang.add(item);
         });
         return listBarang;
      }else{
         throw Exception('Failed to load barang');
      }
   }
   Future<response_action_barang> insertBarang(String nama, jumlah, barang) async{
      final response = await http.post(
         Uri.parse("$_url/insertbarang"),
         // headers: <String, String>{
         //    'Content-Type': 'application/json; charset=UTF-8',
         // },
         body: {
            'nama': nama,
            'jumlah' : jumlah,
            'gambar' : barang,
         },
      );
      // print(nama + jumlah + barang);
      if(response.statusCode == 200){
         final json = jsonDecode(response.body);

         return  response_action_barang.fromJson(json);
      }else{
         throw Exception('Failed to insert barang');
      }
   }

   Future<response_action_barang> updateBarang(
       String id, nama, jumlah, barang
       ) async {
      final response = await http.post(
         Uri.parse('$_url/updatebarang'),
         // headers: <String, String>{
         //    'Content-Type': 'application/json; charset=UTF-8',
         // },
         body: {
            'id': id,
            'nama': nama,
            'jumlah': jumlah,
            'gambar': barang,
         },
      );
      // print(id + nama + jumlah + barang);
      print(response.body);
      if(response.statusCode == 200){
         final json = jsonDecode(response.body);
         return response_action_barang.fromJson(json);
      }else{
         throw Exception('Failed to Update barang');
      }
   }

   Future<response_action_barang> delete(String id) async {
      final response = await http.delete(
         Uri.parse('$_url/deletebarang/$id'),
         headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
         },
      );

      // print(id);
      if(response.statusCode == 200){
         final json = jsonDecode(response.body);
         return response_action_barang.fromJson(json);
      }else{
         throw Exception('Failed to delete barang id $id');
      }
   }
}