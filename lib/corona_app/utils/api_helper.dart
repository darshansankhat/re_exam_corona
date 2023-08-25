import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:re_exam_corona/corona_app/model/corona_model.dart';

class ApiHelper {

  static ApiHelper apiHelper=ApiHelper();

  List json=[];
  List<CoronaModel> jsonData=[];

  Future<List<CoronaModel>> apiDataParsing() async {
    String link = "https://corona.lmao.ninja/v2/countries?yesterday=null&sort=null";

    var response = await http.get(Uri.parse(link));

    json = jsonDecode(response.body);

    print(json);

    jsonData=json.map((e) => CoronaModel.fromJson(e)).toList();

    return jsonData;
  }
}