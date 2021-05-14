import 'package:belajarcrud2/core/models/response_get_barang.dart';
import 'package:belajarcrud2/core/service/ApiService.dart';
import 'package:belajarcrud2/ui/screens/actionscreen.dart';
import 'package:flutter/material.dart';
import 'package:belajarcrud2/ui/widgets/itemListBarang.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  final String id = "HOMESCREEN";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Belajar Crud dasar"),
      ),
      body: FutureBuilder<List<Barang>>(
        future: ApiService.getBarang(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            List<Barang> listbarang = snapshot.data;
            return ListView.builder(
                itemCount: listbarang == null ? 0 : listbarang.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: getCard(listbarang[index]),
                    splashColor: Colors.indigo,
                    onTap: () {
                      Get.to(ActionScreen(barang: listbarang[index]));
                    },
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        backgroundColor: Colors.indigo,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Get.to(ActionScreen(
            barang: null,
          ));
        },
      ),
    );
  }
}
