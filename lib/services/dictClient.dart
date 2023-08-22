import 'package:dio/dio.dart';

class DictClient{
  Dio dict = Dio();
  searchForWord({required String? query}) async{
    String dictURL = "https://api.dictionaryapi.dev/api/v2/entries/en/$query";
    try{
      var resp = await dict.get(dictURL);
      print("This is the response from the API ${resp.data[0]['meanings'][0]['definitions'][0]['definition']}");
      return resp.data[0]['meanings'][0]['definitions'][0]['definition'];
    } catch (error) {
      print("Some error");
    }
  }
}