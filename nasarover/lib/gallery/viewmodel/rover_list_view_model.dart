import 'package:flutter/cupertino.dart';
import 'package:mars/gallery/model/rover_model.dart';
import 'package:mars/gallery/service/rover_service.dart';
import 'package:mars/gallery/viewmodel/rover_view_model.dart';


class RoverListViewModel with ChangeNotifier{


List<RoverViewModel> rovers = <RoverViewModel>[];
  
//RoverListViewModel(){_getRoverImage(roverName);}
 
 Future<void> getRoverImage(String roverName) async{
  List<RoverModel> a =await RoverService().fetchRoverImage(roverName);
  this.rovers=a.map((roverModel)=>RoverViewModel(roverModel:roverModel)).toList();
  notifyListeners();

 }

 Future<void> getCamImage(String roverName, String camName) async{
  List<RoverModel> a =await RoverService().fetchCam(roverName,camName);
  this.rovers=a.map((roverModel)=>RoverViewModel(roverModel:roverModel)).toList();
  notifyListeners();

 }
  
 


}




