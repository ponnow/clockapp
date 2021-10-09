import 'package:clockapp/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';
    //print(timezoneString);

    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () {},
                child: Column(
                  children: const <Widget>[
                    FlutterLogo(),
                    Text(
                      'Alarm Clock',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
              )
            ],
          ),
          const VerticalDivider(
            color: Colors.white,
            width: 2,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Clock',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    formattedTime,
                    style: const TextStyle(color: Colors.white, fontSize: 64),
                  ),
                  Text(
                    formattedDate,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const ClockView(),
                  const Text(
                    'Time Zone',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'UTC' + offsetSign + timezoneString,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
