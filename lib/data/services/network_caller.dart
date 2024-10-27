import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:taskmanager/data/models/network_response.dart';
class network_caller{
  static Future<network_response>getRequest({required String url}) async{
  try {
    Uri uri = Uri.parse(url);
    debugPrint(url);
    final Response response = await get(uri);
   PrintResponse( url, response);
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body);
      return network_response(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData:decodeData

      );
    } else {
      return network_response(
          isSuccess: false, statusCode: response.statusCode);
    }
  } catch(e){
    return network_response(isSuccess: false, statusCode: -1,
    errorMessage: e.toString()
    );
  }
  }
  static Future<network_response> postRequest({required String url,Map<String,dynamic>? body}) async{
  try {
    Uri uri = Uri.parse(url);
    debugPrint(url);
    final Response response = await post(uri,
    headers: {
      'Content-Type':'application/json'
    },
      body:jsonEncode(body),
    );
   PrintResponse( url, response);
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body);
      if(decodeData['status']== 'fail'){
        return network_response(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMessage: decodeData['data']

        );
      }
      return network_response(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData:decodeData

      );
    } else {
      return network_response(
          isSuccess: false, statusCode: response.statusCode);
    }
  } catch(e){
    return network_response(isSuccess: false, statusCode: -1,
    errorMessage: e.toString()
    );
  }
  }

  static PrintResponse(String url,Response response){
    debugPrint('URL: $url\nResponseCode:${response.statusCode}\nBody:${response.body}');
  }
}

