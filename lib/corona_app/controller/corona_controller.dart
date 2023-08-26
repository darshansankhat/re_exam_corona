import 'package:get/get.dart';
import 'package:re_exam_corona/corona_app/model/corona_model.dart';
import 'package:re_exam_corona/corona_app/utils/api_helper.dart';

import '../utils/database_helper.dart';

class CoronaController extends GetxController
{

  List<CoronaModel> dataList=[];
  // List<String> searchData = [];
  RxList<CoronaModel> list=<CoronaModel>[].obs;

  Future<void> apiDataParsing()
  async {
    dataList = await ApiHelper.apiHelper.apiDataParsing();
    list.value=List.from(dataList);
    update();
  }


  List<CoronaModel> fiterlist=[];

  void serchData(String serch)
  {
    fiterlist.clear();
    if(serch.isEmpty)
    {
      list.value=List.from(dataList);
    }
    else
    {


      for(var c in dataList)
      {
        if(c.country!.toLowerCase().contains(serch!.toLowerCase()) )
        {
          fiterlist.add(c);
        }
      }
      list.value=List.from(fiterlist);
    }
    update();
  }

  RxList dataList1 = [].obs;

  Future<void> LoadDB()
  async {
    dataList1.value = await DB_Helper.db_helper.redDB();
  }
}