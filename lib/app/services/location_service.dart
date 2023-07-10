import 'dart:convert';

import 'package:challenge_it_flutter/app/constants/service_constant.dart';
import 'package:challenge_it_flutter/app/models/api_response.dart';
import 'package:challenge_it_flutter/app/models/location.dart';
import 'package:challenge_it_flutter/app/models/locationATM.dart';
import 'package:http/http.dart' as http;

// get All location
Future<ApiResponse> getAllLocation() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.get(Uri.parse(locationURL), headers: {'Accept': 'application/json'});
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['locations'].map((p)=>Location.fromJson(p)).toList();
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

// get All location ATM
Future<ApiResponse> getAllLocationATM() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.get(Uri.parse(locationATMURL), headers: {'Accept': 'application/json'});
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['locationATMs'].map((p)=>LocationATM.fromJson(p)).toList();
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}
