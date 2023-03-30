import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location = "";
  String time = "";
  String flag = "";
  String url = "";
  int isDaytime = 0;

  WorldTime({required this.location, required this.flag, required this.url});

  // ignore: empty_constructor_bodies
  Future<void> getTime() async {
    // try {
    //   // make the request
    //   Response response =
    //       await get("http://worldtimeapi.org/api/timezone/${url}" as Uri);
    //   Map data = jsonDecode(response.body);

    //   // get properties from json
    //   String dt = data['datetime'].toString();
    //   String os = data['utc_offset'].toString().substring(1, 3);

    //   // create DateTime object
    //   DateTime now = DateTime.parse(dt);
    //   now = now.add(Duration(hours: int.parse(os)));
    //   print("now is ${now}");

    //   // set the time property
    //   if (now.hour > 6 && now.hour < 20) {
    //     isDaytime = 1;
    //   } else {
    //     isDaytime = 0;
    //   }
    //   time = DateFormat.jm().format(now);
    // } catch (e) {
    //   // print("Hiiiiiiii");
    //   print("the error is ${e}");
    //   time = 'could not get time';
    // }
    final response = await http
        .get(Uri.parse("http://worldtimeapi.org/api/timezone/${url}"));
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      // print(data.toString());
      String dt = data["datetime"].toString();
      // print(dt);
      String os = data["utc_offset"].toString().substring(1, 3);
      // print(os);

      DateTime now = DateTime.parse(dt);
      now = now.add(Duration(hours: int.parse(os)));
      // print(now);
      // set time property
      if (now.hour > 6 && now.hour < 20) {
        isDaytime = 1;
      } else {
        isDaytime = 0;
      }
      time = DateFormat.jm().format(now);
    } else {
      throw Exception("Failed");
    }
    // Map data = jsonDecode(response.body);
    // print(data);
    // Response response =
    //     await get("https://jsonplaceholder.typicode.com/todos/1" as Uri);
    // Map data = jsonDecode(response.body);
    // print(data);
    print(response.body);
  }
}
