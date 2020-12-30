import 'dart:convert';

import 'package:dataupah/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Models> listModels = [];

  var loading = false;
  Future<Null> getData() async {
    setState(() {
      loading = true;
    });

    final respon = await http.get('https://api.apispreadsheets.com/data/5764/');

    var data = jsonEncode(respon.body);

    // print(data);

    if (respon.statusCode == 200) {
      Map<String, dynamic> map = json.decode(respon.body);
      List<dynamic> data = map["data"];

      // print(data);
      setState(() {
        for (Map i in data) {
          listModels.add(Models.fromJson(i));
        }
        // loading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Upah Pegawai"),
        actions: [],
      ),
      body: Container(
        child: ListView.builder(
            itemCount: listModels.length,
            itemBuilder: (context, i) {
              final data1 = listModels[i];

              // print(data);
              print(data1.nama);
              return Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(data1.tgl1),
                      Text(
                        data1.nama == null ? '' : data1.nama.toUpperCase(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(data1.nama == null
                          ? ''
                          : 'Bulan : ' + data1.bulan.toUpperCase()),
                      Text(data1.nama == null
                          ? ''
                          : 'Gaji : ' + data1.total.toUpperCase())
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
