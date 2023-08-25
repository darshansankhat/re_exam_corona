import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re_exam_corona/corona_app/model/corona_model.dart';
import 'package:re_exam_corona/corona_app/model/db_model.dart';
import 'package:re_exam_corona/corona_app/utils/database_helper.dart';
import 'package:sizer/sizer.dart';

import '../controller/corona_controller.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    CoronaController controller = Get.put(CoronaController());

    int index = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff473F97),
        leading: Icon(
          Icons.sort,
          color: Colors.white,
          size: 30,
        ),
        centerTitle: true,
        title: Text(
          "${controller.dataList[index].country}",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Icon(
            Icons.notifications_none_sharp,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(width: 10),
        ],
        elevation: 0,
      ),
      backgroundColor: Color(0xff473F97),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                DBModel d1 = DBModel(
                  name: controller.list[index].country,
                  flag: controller.list[index].countryInfo!.flag,
                  cases: "${controller.list[index].cases}",
                );
                DB_Helper.db_helper.insertDB(d1);
                Get.back();
              },
              child: Text("Add to book mark")),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              info(47.w, Colors.orange, "Cases",
                  "${controller.dataList[index].cases}", 21),
              info(47.w, Colors.redAccent, "Recovered",
                  "${controller.dataList[index].recovered}", 21),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              info(30.w, Colors.green, "Today\nCases",
                  "${controller.dataList[index].todayCases}", 17),
              info(30.w, Colors.blue.shade300, "Deaths",
                  "${controller.dataList[index].deaths}", 17),
              info(30.w, Colors.deepPurpleAccent, "Today\nDeaths",
                  "${controller.dataList[index].todayDeaths}", 17),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Container(
            height: 16.h,
            width: 100.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue,
            ),
            child: Row(
              children: [
                Image.asset("assets/images/n.png"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Do your own test!\n",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Follow the instruction to \ndo your own test.",
                      style: TextStyle(fontSize: 18, color: Colors.white60),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget info(double wi, Color c1, String data, String numbers, double s) {
    return Container(
      height: 15.h,
      width: wi,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: c1,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "$data",
              style: TextStyle(
                  fontSize: s,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "$numbers",
              style: TextStyle(fontSize: s, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
