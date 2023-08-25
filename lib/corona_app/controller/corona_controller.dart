import 'package:get/get.dart';
import 'package:re_exam_corona/corona_app/model/corona_model.dart';
import 'package:re_exam_corona/corona_app/utils/api_helper.dart';

class CoronaController extends GetxController
{

  List<CoronaModel> dataList=[];
  List<String> searchData = [];

  Future<void> apiDataParsing()
  async {
    dataList = await ApiHelper.apiHelper.apiDataParsing();
    update();
  }

  RxList<CoronaModel> list=<CoronaModel>[].obs;
  List<CoronaModel> fiterlist=[];

  void serchData(String serch)
  {
    if(serch.isEmpty)
    {
      list.value=List.from(dataList);
    }
    else
    {
      fiterlist.clear();

      for(var c in dataList)
      {
        if(c.country!.toLowerCase().contains(serch!.toLowerCase()) )
        {
          fiterlist.add(c);
        }
      }
      list.value=List.from(fiterlist);
    }
  }
}