import 'package:flutter/foundation.dart';
import 'package:taskbyposs/data_model/data_model.dart';
import 'package:taskbyposs/service/api/api.dart';
import 'package:get_it/get_it.dart';
import 'package:taskbyposs/service/api/http_req.dart';

class ApiService extends ChangeNotifier {
  PupularMovie _movie = PupularMovie();
  Details _details = Details();
  YoutubeData _youtube = YoutubeData();
  var api = locator<Api>();
  PupularMovie get movies => _movie;
  Details get details => _details;
  YoutubeData get youtubeData => _youtube;
  String _videoId = "";
  String get videoId => _videoId;

  set videoId(String video) {
    _videoId = video;
    notifyListeners();
  }

  set video(YoutubeData video) {
    _youtube = video;
    notifyListeners();
  }

  set movies(PupularMovie movies) {
    _movie = movies;
    notifyListeners();
  }

  set details(Details details) {
    _details = details;
    notifyListeners();
  }

  getReq() async {
    PupularMovie response = await api.getMovies();
    print("=============================");
    print(response);

    movies = response;
  }

  getDetails(int id) async {
    Details response = await api.getDetails(id);
    print("=============================");
    print(response.homepage);
    details = response;
  }

  getVideo(int id) async {
    YoutubeData response = await api.getYTData(id);

    if (response.results![0].key != null) {
      videoId = response.results![0].key.toString();
      video = response;
      print("oooooooooooooooo");
      print(response.results?[0].key);
    }
  }
}

GetIt locator = GetIt.instance;
const bool USE_FAKE_IMPLEMENTATION = false;
void setupLocator() {
  locator.registerLazySingleton<Api>(() => HttpReq());
}
