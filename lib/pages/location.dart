import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'gr.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'de.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'gb.png'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow', flag: 'ru.png'),
    WorldTime(url: 'Europe/Paris', location: 'Paris', flag: 'fr.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'us.png'),
    WorldTime(
        url: 'America/Los_Angeles', location: 'Los Angeles', flag: 'us.png'),
    WorldTime(url: 'America/Sao_Paulo', location: 'São Paulo', flag: 'br.png'),
    WorldTime(
        url: 'America/Mexico_City', location: 'Mexico City', flag: 'mx.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'us.png'),
    WorldTime(url: 'America/Toronto', location: 'Toronto', flag: 'ca.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'jp.png'),
    WorldTime(url: 'Asia/Shanghai', location: 'Shanghai', flag: 'cn.png'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'ae.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'kr.png'),
    WorldTime(url: 'Asia/Singapore', location: 'Singapore', flag: 'sg.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'au.png'),
    WorldTime(
        url: 'Australia/Melbourne', location: 'Melbourne', flag: 'au.png'),
    WorldTime(
        url: 'Africa/Johannesburg', location: 'Johannesburg', flag: 'za.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'eg.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Choose a location",
          style: TextStyle(
              fontFamily: "Red Hat Display", fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {},
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/flags/${locations[index].flag}'),
              ),
            ),
          );
        },
        itemCount: locations.length,
      ),
    );
  }
}
