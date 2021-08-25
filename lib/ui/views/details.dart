import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

import 'package:taskbyposs/service/api_service.dart';

class MovieDetails extends StatefulWidget {
  final id;
  MovieDetails({
    Key? key,
    @required this.id,
  }) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  var image_url = 'https://www.themoviedb.org/t/p/w138_and_h175_face/';

  @override
  void initState() {
    Provider.of<ApiService>(context, listen: false).getDetails(widget.id);
    print(""""""
        """"""
        """"""
        """"""
        """"""
        """"""
        """"""
        """"""
        """"""
        """"""
        """"""
        """""");
    var image =
        Provider.of<ApiService>(context, listen: false).details.posterPath;
    print(image_url + image!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiService>(
      builder: (context, data, child) {
        return SafeArea(
          child: Scaffold(
            body: Stack(fit: StackFit.expand, children: [
              Image.network(
                "$image_url+ ${data.details.posterPath.toString()}",
                fit: BoxFit.cover,
              ),
              BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: Container(
                          width: 400.0,
                          height: 400.0,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: NetworkImage(
                                  "$image_url+ ${data.details.posterPath.toString()}",
                                ),
                                fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 20.0,
                                  offset: new Offset(0.0, 10.0))
                            ]),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 0.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              "${data.details.originalTitle}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontFamily: 'Arvo'),
                            )),
                            Text(
                              " ${data.details.popularity}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: 'Arvo'),
                            )
                          ],
                        ),
                      ),
                      Text("      ${data.details.overview}",
                          style: const TextStyle(
                              color: Colors.white, fontFamily: 'Arvo')),
                      Padding(
                        padding: new EdgeInsets.all(10.0),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}
