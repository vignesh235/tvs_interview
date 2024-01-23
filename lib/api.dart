import 'dart:convert';
import 'package:api/hive.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Userdetails extends StatefulWidget {
  const Userdetails({super.key});

  @override
  State<Userdetails> createState() => _UserdetailsState();
}

class _UserdetailsState extends State<Userdetails> {
  List user = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    api();
  }

  Future getdata() async {
    Box box = await Hive.openBox('user');
    print("vvvvvvvvvvvvvvvvv");
    print(box.toMap().values.toList());
    List userList = box.values.toList();

    setState(() {
      user = userList;
    });
    print(user.length);

    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // setState(() {
    //   user = prefs.getStringList(
    //     'user',
    //   )!;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: user.length,
                itemBuilder: (BuildContext context, int index) {
                  int index_ = index + 1;
                  return Card(
                    child: ListTile(
                        leading: Text(index_.toString()),
                        title: Text("User name: ${user[index].touristName}"),
                        trailing: Text(user[index].touristEmail),
                        subtitle: Text(user[index].touristLocation)),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Future api() async {
    Box box = await Hive.openBox('user');

    print("ppppppppppppppppp");

    var url = await http
        .get(Uri.parse("http://restapi.adequateshop.com/api/Tourist?page=1"));
    print(url.body);
    if (url.statusCode == 200) {
      print(jsonDecode(url.body)['data']);
      for (var i in jsonDecode(url.body)['data']) {
        print(i['tourist_name']);
        Tourist dataModel = Tourist(
            id: i['id'],
            touristName: i['tourist_name'],
            touristEmail: i['tourist_email'],
            touristLocation: i['tourist_location'],
            createdAt: i['createdat']);
        box.add(dataModel);
      }
      // print("ooo");
      // print(box.values);
      // // await prefs
      // //     .setStringList('user', [jsonDecode(url.body)['data'].toString()]);
      getdata();
    }
  }
}
