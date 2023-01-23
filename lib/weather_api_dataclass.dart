import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weatherapp_simple/weather_model.dart';
import 'package:http/http.dart' as http;

//Api key : 44cf1c04c000419693b93338232001

class WhetherData{
  Future<Whether> getWhetherData(String place) async{
    try{
      final queryParameters={
        'Key': '44cf1c04c000419693b93338232001',
        'q': place,
      };
      final uri=Uri.http('api.weatherapi.com','/v1/current.json', queryParameters);
      final response=await http.get(uri);
      if(response.statusCode==200){
        return Whether.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception("Can not get Whether");
      }
    }
    catch(e){
      rethrow;
    }
  }
}