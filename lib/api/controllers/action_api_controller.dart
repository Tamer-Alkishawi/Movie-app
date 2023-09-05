import 'dart:convert';
import 'package:movies_app/api/api_settings.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/api/models/api_model.dart';

class ActionApiController{

  Future<List<ApiModel>> getAction() async{
    var uri = Uri.parse(ApiSettings.actionApi);
    var response = await http.get(uri);

    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      var datajsonArray = jsonData['results'] as List;
      return datajsonArray.map((e) => ApiModel.fromJson(e)).toList();
    }
    return [];
  }
  Future<List<ApiModel>> getMoreAction(int startIndex , int pageSize) async{
    var uri = Uri.parse(ApiSettings.actionApi);
    var response = await http.get(uri);

    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      var datajsonArray = jsonData['results'] as List;
      return datajsonArray.map((e) => ApiModel.fromJson(e)).toList();
    }
    return [];
  }
}