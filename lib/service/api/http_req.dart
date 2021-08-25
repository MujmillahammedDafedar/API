import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taskbyposs/data_model/data_model.dart';
import 'package:taskbyposs/service/api/api.dart';

const Duration TIMEOUT = Duration(seconds: 10);

class HttpReq implements Api {
  @override
  Future<PupularMovie> getMovies() async {
    final response = await getRequest(
        'https://api.themoviedb.org/3/movie/popular?api_key=ffdeb32e46fe4eb4421be61e975fc90b&language=en-US&page=1');

    print("==============================================");
    print(PupularMovie.fromJson(response));
    return PupularMovie.fromJson(response);
  }

  @override
  Future<Details> getDetails(int id) async {
    final response = await getRequest(
        'https://api.themoviedb.org/3/movie/$id?api_key=ffdeb32e46fe4eb4421be61e975fc90b&language=en-US');

    print("==============================================");
    print(Details.fromJson(response));
    return Details.fromJson(response);
  }

  @override
  Future<YoutubeData> getYTData(int id) async {
    final response = await getRequest(
        'https://api.themoviedb.org/3/movie/$id/videos?api_key=ffdeb32e46fe4eb4421be61e975fc90b&language=en-US');
    print("==============================================");
    print(YoutubeData.fromJson(response));
    return YoutubeData.fromJson(response);
  }
}

Future<Map<String, dynamic>> getRequest(url) async {
  print(url);
  var uri = Uri.parse(url);
  final http.Response response =
      await http.get(uri).timeout(TIMEOUT, onTimeout: () {
    return Future.value(http.Response(json.encode('timeout'), 400));
  }).catchError((error) {
    return print('error');
  });
  Map<String, dynamic> responseBody = json.decode(response.body);
  print(responseBody);
  if (response.statusCode < 300 && response.statusCode >= 200) {
    responseBody.putIfAbsent("success", () => true);
    return responseBody;
  } else {
    responseBody.putIfAbsent("success", () => false);
    return responseBody;
  }
}
