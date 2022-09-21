import 'package:flutter/cupertino.dart';
import 'package:nasarover/gallery/model/rover_model.dart';
import 'package:nasarover/gallery/service/rover_service.dart';
import 'package:nasarover/gallery/viewmodel/rover_view_model.dart';

class RoverListViewModel with ChangeNotifier {
  List<RoverViewModel> rovers = <RoverViewModel>[];

  Future<void> getRoverImage(String roverName) async {
    List<RoverModel> a = await RoverService().fetchRoverImage(roverName);
    this.rovers =
        a.map((roverModel) => RoverViewModel(roverModel: roverModel)).toList();
    notifyListeners();
  }
}
