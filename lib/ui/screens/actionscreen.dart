import 'package:flutter/material.dart';
import 'package:belajarcrud2/core/models/response_get_barang.dart';
import 'package:belajarcrud2/core/service/ApiService.dart';
import 'package:belajarcrud2/ui/widgets/formAction.dart';
import 'package:get/get.dart';

class ActionScreen extends StatefulWidget {
  final String id = "ACTIONSCREEN";

  Barang barang;

  ActionScreen({this.barang});

  @override
  _ActionScreenState createState() => _ActionScreenState();
}

class _ActionScreenState extends State<ActionScreen> {
  final _formKey = GlobalKey<FormState>();

  ApiService service = ApiService();

  TextEditingController _nama, _jumlah, _barang;

  var _isUpdate = false;
  var _idBarang;

  @override
  void initState() {
    super.initState();
    if (widget.barang != null) {
      _isUpdate = true;
      print("terdetek");
      _idBarang = widget.barang.barangId;
      _nama = TextEditingController(text: widget.barang.barangNama);
      _jumlah = TextEditingController(text: widget.barang.barangJumlah);
      _barang = TextEditingController(text: widget.barang.barangGambar);
    } else {
      _nama = TextEditingController();
      _jumlah = TextEditingController();
      _barang = TextEditingController();
      print("tidak terdetek");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
            widget.barang == null ? "Insert Data" : widget.barang.barangNama),
        actions: [
          _isUpdate
              ? IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    Get.defaultDialog(
                        textConfirm: "Hapus",
                        onCancel: () => Get.back(),
                        onConfirm: () async {
                          await service.delete(_idBarang).then((value) {
                            if (value.sukses) {
                              Get.offAllNamed('/');
                              Get.snackbar("Suksess", "Data behasil dihapus");
                            }
                          });
                        },
                        title: "Remove data " + widget.barang.barangNama,
                        middleText:
                            "Apakah Anda yakin ingin menghapus data ini??");
                  },
                )
              : Text(''),
        ],
      ),
      body: SingleChildScrollView(
        child: formData(_idBarang, _nama, _jumlah, _barang, _isUpdate),
      ),
    );
  }
}
