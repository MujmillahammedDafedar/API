import 'dart:io';

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
  String videoURL = "https://www.youtube.com/watch?v=RFZG_IG9EqA";

  late YoutubePlayerController _controller;
  var idd;

  @override
  void initState() {
    Provider.of<ApiService>(context, listen: false).getVideo(widget.id);
    print('iiiiiiiiiiiiiiiiiiiiiiiiii');

    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.getThumbnail(videoId: "RFZG_IG9EqA"));

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
    return Consumer<ApiService>(builder: (context, data, child) {
      return data.videoId == null
          ? Text("Please wait while we were fetching video")
          : YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: data.videoId, //Add videoID.
                flags: YoutubePlayerFlags(
                  hideControls: false,
                  controlsVisibleAtStart: true,
                  autoPlay: false,
                  mute: false,
                ),
              ),
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.red,
            );
    });
  }
}
