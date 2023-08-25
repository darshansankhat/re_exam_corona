import 'package:flutter/material.dart';
import 'package:re_exam_corona/corona_app/utils/database_helper.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {

  List data =[];

  @override
  void initState() {
    super.initState();
    data = DB_Helper.db_helper.redDB() as List;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ListView.builder(itemBuilder:(context, index) {
        return ListTile(
          leading: Image.network("${data[0]['flag']}"),
          title: Text("${data[0]['na,e']}"),
          subtitle: Text("${data[0]['cases']}"),
        );
      },),
    ),);
  }
}
