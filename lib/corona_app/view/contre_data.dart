import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re_exam_corona/corona_app/controller/corona_controller.dart';
import 'package:sizer/sizer.dart';

class ContreData extends StatefulWidget {
  const ContreData({super.key});

  @override
  State<ContreData> createState() => _ContreDataState();
}

class _ContreDataState extends State<ContreData> {
  CoronaController controller = Get.put(CoronaController());
  TextEditingController txtsearch = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.apiDataParsing();
    controller.serchData("");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff473F97),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: txtsearch,
                    onChanged: (value) {
                      controller.serchData(value);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search contre.....",
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.serchData("");
                        },
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //contre
            controller.dataList.isEmpty
                ? Center(
                    child: Center(
                        child: CircularProgressIndicator(
                    color: Colors.deepOrange,
                  )))
                : Obx(
                    () => Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.toNamed("info", arguments: index);
                            },
                            child: Container(
                              height: 15.h,
                              margin: EdgeInsets.all(5),
                              width: 40.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.network(
                                    "${controller.list[index].countryInfo?.flag}",
                                    height: 90,
                                    width: 150,
                                  ),
                                  Text(
                                    "${controller.list[index].country}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: controller.list.length,
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
