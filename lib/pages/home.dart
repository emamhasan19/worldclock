import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    // print(data);
    //set bg
    String bgImage;
    if (data["isDaytime"]==1) {
      bgImage = "day.png";
    } else {
      bgImage = "night.png";
    }
    Color? bgColor;
    if (data["isDaytime"]==0) {
      bgColor = Colors.blue;
    } else {
      bgColor = Colors.indigo[700];
    }
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/${bgImage}"),
            fit: BoxFit.cover,
          ),
        ),

        //   decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('images/${bgImage}'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, "/location");
                  if (result != null) {
                    setState(() {
                      data = {
                        "time": result['time'],
                        "location": result['location'],
                        "idDaytime": result['isDaytime'],
                        "flag": result['flag'],
                      };
                    });
                  }
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey[300],
                ),
                label: Text(
                  "Edit Location",
                  style: TextStyle(color: Colors.grey[300]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data["location"],
                    style: TextStyle(
                        fontSize: 28, letterSpacing: 2, color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                data["time"],
                style: TextStyle(fontSize: 60, color: Colors.white),
              )
            ],
          ),
        ),
      )),
    );
  }
}
