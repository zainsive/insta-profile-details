import 'package:flutter/material.dart';
import 'package:insta_reeler/Services/insta_util.dart';
import 'package:flutter_insta/flutter_insta.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DetailsScreen extends StatefulWidget {
  String username;
  DetailsScreen(this.username);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  InstaUtils instaUtils = InstaUtils();
  Future<FlutterInsta> _flutterInsta;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _flutterInsta = instaUtils.findDetails(widget.username);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<FlutterInsta>(
          future: _flutterInsta,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 70.0,
                          backgroundImage:
                              NetworkImage("${snapshot.data.imgurl}"),
                          backgroundColor: Colors.transparent,
                        ),
                      ],
                    ),
                    Text(
                      "${snapshot.data.username}",
                      style: TextStyle(
                          fontSize: 32.0, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Follower: ${snapshot.data.followers}",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 30.0,
                        ),
                        Text("Following: ${snapshot.data.following}",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w700))
                      ],
                    ),
                    Expanded(
                      child: MasonryGridView.count(
                        crossAxisCount: 4,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        itemCount: snapshot.data.feedImagesUrl.length,
                        itemBuilder: (context, index) {
                          return Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.network(
                              "${snapshot.data.feedImagesUrl[index]}",
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
