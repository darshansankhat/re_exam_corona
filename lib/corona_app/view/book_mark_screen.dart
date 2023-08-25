import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re_exam_corona/corona_app/controller/corona_controller.dart';
import 'package:re_exam_corona/corona_app/utils/database_helper.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {

  CoronaController controller = Get.put(CoronaController());

  @override
  void initState() {
    super.initState();
    controller.LoadDB();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ListView.builder(
        itemCount: controller.dataList1.length,
        itemBuilder:(context, index)
      {
        return ListTile(
          leading: Image.network("${controller.dataList1[index]['flag']}"),
          title: Text("${controller.dataList1[index]['name']}"),
          subtitle: Text("${controller.dataList1[index]['cases']}"),
        );
      },),
    ),);
  }
}
