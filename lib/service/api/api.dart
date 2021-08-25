import 'package:taskbyposs/data_model/data_model.dart';

abstract class Api {
  Future<PupularMovie> getMovies();
  Future<Details> getDetails(int id);
  Future<YoutubeData> getYTData(int id);
}
