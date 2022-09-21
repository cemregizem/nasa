import 'package:mars/gallery/model/rover_model.dart';


class RoverViewModel {
  late RoverModel _roverModel;

  RoverViewModel({required RoverModel roverModel}) : _roverModel = roverModel;

  int? get id {
    return _roverModel.id;
  }

  int? get sol {
    return _roverModel.sol;
  }

  Camera? get camera {
    return _roverModel.camera;
  }
  
  String? get imgSrc {
    return _roverModel.imgSrc;
  }
  String? get earthDate {
    return _roverModel.earthDate;
  }

  Rover? get rover {
    return _roverModel.rover;
  }
  


}
