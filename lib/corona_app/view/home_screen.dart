import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff473F97),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.sort,
              size: 26,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed("book");
              },
              icon: Icon(
                Icons.bookmark,
                size: 26,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //top
            Container(
              height: 35.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                color: Color(0xff473F97),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Covid-19",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 6.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                "You are in \n       🇮🇳",
                                style: TextStyle(fontSize: 18),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Are you feeling sick?",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "If you feeli sick with any of covid-19 symptoms please call or SMS us immediately for help.",
                      style: TextStyle(fontSize: 18, color: Colors.white54),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 7.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.redAccent,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "📲 Call now",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          height: 7.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.blue,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "📲 SMS now",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //contre wis data
            SizedBox(height: 2.h,),
            InkWell(
              onTap: () {
                Get.toNamed("contre");
              },
              child: Container(
                height: 10.h,
                width: 60.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xff473F97),
                ),
                alignment: Alignment.center,
                child: Text("Show Contre wis Data",style: TextStyle(fontSize: 20,color: Colors.white),),
              ),
            ),
            //bottom
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 16.h,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff473F97),
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
            ),
          ],
        ),
      ),
    );
  }
}
