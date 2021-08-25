import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:taskbyposs/data_model/data_model.dart';
import 'package:taskbyposs/service/api_service.dart';
import 'package:taskbyposs/ui/views/details.dart';
import 'package:taskbyposs/ui/views/play_video.dart';

Widget CutomeIconButton(String image) {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0, top: 4.0),
    child: InkWell(
        onTap: () {
          print("hello");
        },
        child: Card(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          elevation: 2,
          child: Container(
            height: 36.h,
            width: 40.w,
            decoration: myBoxDecoration(),
            child: Image.asset(image),
          ),
        )),
  );
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius:
        BorderRadius.all(Radius.circular(5.0) //         <--- border radius here
            ),
  );
}

class PupolarMovieList extends StatelessWidget {
  final id;
  final title;
  final path;
  final overview;
  var image_url = 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/';
  PupolarMovieList(this.title, this.path, this.overview, this.id);
  var nullImage =
      'https://media-exp1.licdn.com/dms/image/C5616AQGa-1AmZhHg6w/profile-displaybackgroundimage-shrink_200_800/0/1611135317788?e=1635379200&v=beta&t=EpTXqCQg8UnTumrbmZu_9W0rbASwvnJycV52DC8sRC4';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  child: Container(
                    width: 70.0,
                    height: 70.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey,
                    image: DecorationImage(
                        image: NetworkImage(
                            path == null ? nullImage : image_url + path),
                        fit: BoxFit.cover),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 5.0,
                          offset: Offset(2.0, 5.0))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    children: [
                      Text(
                        title ?? "Null",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Arvo',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const Padding(padding: const EdgeInsets.all(2.0)),
                      Text(
                        overview ?? "Null",
                        maxLines: 3,
                        style: const TextStyle(
                            color: Color(0xff8785A4), fontFamily: 'Arvo'),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return PlayVideo(id: id);
                  }));
                },
                tooltip: "Play Trailer",
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.pink,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ),
              IconButton(
                tooltip: "Details",
                onPressed: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return MovieDetails(id: id);
                  }));
                },
                icon: Icon(
                  Icons.details,
                  color: Colors.pink,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ),
            ],
          ),
          Container(
            width: 300.0,
            height: 0.8,
            color: const Color(0xD2D2E1ff),
            margin: const EdgeInsets.all(16.0),
          )
        ],
      ),
    );
  }
}
