import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location = ''; // location time for the UI
  String time = ''; // the time in that location
  String flag = ''; // url to an asset flag icon
  String url = ''; // location url for api endpoint
  bool isDaytime = false;

  WorldTime({this.location = '', this.flag = '', this.url = ''});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // print(datetime);
      // print(offset);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set time property
      isDaytime = now.hour > 6 && now.hour < 20;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print(e);
      time = 'Could not get time data 😢';
    }
  }
}
