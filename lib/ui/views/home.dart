import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskbyposs/core/buttons.dart';
import 'package:taskbyposs/data_model/data_model.dart';
import 'package:taskbyposs/service/api_service.dart';
import 'package:taskbyposs/utils/constant/colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ApiService>(context, listen: false).getReq();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiService>(builder: (context, data, child) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.3,
            centerTitle: true,
            backgroundColor: Colors.white,
            title: const Text(
              'Movies',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Arvo',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: {data.movies.results?.length} == null
                        ? 0
                        : data.movies.results?.length,
                    itemBuilder: (context, i) {
                      // return Text("${data.movies.results?[i].title}");
                      return PupolarMovieList(
                          data.movies.results?[i].originalTitle,
                          data.movies.results?[i].posterPath,
                          data.movies.results?[i].overview,
                          data.movies.results?[i].id);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
