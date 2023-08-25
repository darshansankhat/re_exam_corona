import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re_exam_corona/corona_app/view/book_mark_screen.dart';
import 'package:re_exam_corona/corona_app/view/contre_data.dart';
import 'package:re_exam_corona/corona_app/view/home_screen.dart';
import 'package:re_exam_corona/corona_app/view/info_screen.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/":(p0) => HomeScreen(),
          "contre":(p0) => ContreData(),
          "info":(p0) => InfoScreen(),
          "book":(p0) => BookMarkScreen(),
        },
        theme: ThemeData(useMaterial3: true),

      ),
    ),
  );
}