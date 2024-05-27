import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
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
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'us.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'us.png'),
    WorldTime(
        url: 'America/Los_Angeles', location: 'Los Angeles', flag: 'us.png'),
    WorldTime(url: 'America/Sao_Paulo', location: 'São Paulo', flag: 'br.png'),
    WorldTime(
        url: 'America/Mexico_City', location: 'Mexico City', flag: 'mx.png'),
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
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'eg.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDaytime": instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        // Verwende dynamische Farben oder Fallback-Farbschemata
        ColorScheme lightColorScheme =
            lightDynamic ?? ColorScheme.fromSwatch(primarySwatch: Colors.blue);
        ColorScheme darkColorScheme =
            darkDynamic ?? ColorScheme.fromSwatch(primarySwatch: Colors.blue);

        // Wähle das Farbschema basierend auf dem aktuellen Systemthema
        bool isLightMode = Theme.of(context).brightness == Brightness.light;
        ColorScheme colorScheme =
            isLightMode ? lightColorScheme : darkColorScheme;

        ThemeData themeData = ThemeData(
          colorScheme: colorScheme,
          useMaterial3: true, // Optional: Aktiviert Material 3 Design
        );

        return Theme(
          data: themeData,
          child: Scaffold(
            backgroundColor: colorScheme.secondaryContainer,
            appBar: AppBar(
              title: Text(
                "Choose a location",
                style: TextStyle(
                  fontFamily: "Red Hat Display",
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onPrimary,
                ),
              ),
              centerTitle: true,
              backgroundColor: colorScheme.primary,
            ),
            body: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                return Card(
                  color: colorScheme.primaryFixed,
                  child: ListTile(
                    onTap: () {
                      updateTime(index);
                    },
                    title: Text(
                      locations[index].location,
                      style: TextStyle(color: colorScheme.onPrimaryFixed),
                    ),
                    leading: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(0.0), // Anpassung der Rundung
                      child: Image.asset(
                        'assets/flags/${locations[index].flag}',
                        width: 40,
                        fit:
                            BoxFit.cover, // Optional, um das Bild zuzuschneiden
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
