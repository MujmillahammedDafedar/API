import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskbyposs/service/api_service.dart';
import 'package:taskbyposs/utils/constant/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayVideo extends StatefulWidget {
  final id;
  const PlayVideo({Key? key, this.id}) : super(key: key);

  @override
  _PlayVideoState createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  @override
  String? videoURL = "https://www.youtube.com/watch?v=RFZG_IG9EqA";

  late YoutubePlayerController _controller;

  @override
  void initState() {
    Provider.of<ApiService>(context, listen: false).getVideo(widget.id);
    var idd = Provider.of<ApiService>(context, listen: false)
        .youtubeData
        .results?[0]
        .key;

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.getThumbnail(videoId: idd.toString()),
    );

    super.initState();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
        if (orientation == Orientation.landscape) {
          return Scaffold(
            body: youtubeHierarchy(),
          );
        } else {
          return Scaffold(
            backgroundColor: white,
            appBar: AppBar(
              title: Text("Trailer"),
            ),
            body: youtubeHierarchy(),
          );
        }
      }),
    );
  }

  youtubeHierarchy() {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.fill,
          child: YoutubePlayer(
            controller: _controller,
          ),
        ),
      ),
    );
  }
}
