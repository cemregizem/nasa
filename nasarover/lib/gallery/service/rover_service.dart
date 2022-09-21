import 'dart:convert';
import 'package:nasarover/gallery/model/rover_model.dart';
import 'package:http/http.dart' as http;
import 'package:nasarover/utils/constants.dart';

class RoverService {
   Future<List<RoverModel>> fetchRoverImage(String roverName) async {

    
    final response = await http.get(Uri.parse(Constants.roverInfo(roverName)));

    if (response.statusCode == 200) {

      final result =jsonDecode(response.body);

      Iterable list = (result["photos"] ?? []) as List;
      
      return list.map((roverModel) => RoverModel.fromJson(roverModel)).toList();

    } else {
      
      throw Exception("Failed to get Rover Photos");
    }
  }

    Future<List<RoverModel>> fetchCam (String roverName,String camName) async {

    
    final response = await http.get(Uri.parse(Constants.camInfo(roverName,camName)));

    if (response.statusCode == 200) {

      final result =jsonDecode(response.body);

      Iterable list = (result["photos"] ?? []) as List;
      
      return list.map((roverModel) => RoverModel.fromJson(roverModel)).toList();

    } else {
      
      throw Exception("Failed to get Rover Photos");
    }
  }
}

