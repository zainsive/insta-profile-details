import 'package:flutter_insta/flutter_insta.dart';

class InstaUtils {
  Future<FlutterInsta> findDetails(String username) async {
    FlutterInsta flutterInsta = new FlutterInsta();
    await flutterInsta.getProfileData(username);
    return flutterInsta;
  }
}
