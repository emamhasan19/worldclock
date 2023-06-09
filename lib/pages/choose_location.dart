import 'package:flutter/material.dart';

import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime ins = locations[index];
    await ins.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      "location": ins.location,
      "time": ins.time,
      "flag": ins.flag,
      "isDaytime": ins.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
  }
  // void getData() async {
  //   //simulate network request for a username
  //   String username = await Future.delayed(
  //     Duration(seconds: 3),
  //     () {
  //       return ("Bijoy");
  //     },
  //   );
  //   //simulate network request to get bio of the username
  //   String bio = await Future.delayed(
  //     Duration(seconds: 2),
  //     () {
  //       return ("vega,musician,egg collector");
  //     },
  //   );
  //   print("${username} -- ${bio}");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage("images/${locations[index].flag}"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
