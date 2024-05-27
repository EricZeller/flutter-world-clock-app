import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    String backgroundImage = data['isDaytime'] ? 'sun.png' : 'moon.png';

    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        // Use dynamic colors or fallback to default color schemes
        ColorScheme lightColorScheme =
            lightDynamic ?? ColorScheme.fromSwatch(primarySwatch: Colors.blue);
        ColorScheme darkColorScheme =
            darkDynamic ?? ColorScheme.fromSwatch(primarySwatch: Colors.blue);

        // Choose color scheme based on whether it's daytime or not
        ColorScheme colorScheme =
            data['isDaytime'] ? lightColorScheme : darkColorScheme;

        return Scaffold(
          backgroundColor: colorScheme.surface,
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data['location'],
                            style: TextStyle(
                              fontSize: 48,
                              letterSpacing: 2,
                              color: colorScheme.onSurface,
                              fontFamily: "Pacifico",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        data['time'],
                        style: TextStyle(
                            fontSize: 90,
                            color: colorScheme.onSurface,
                            fontFamily: "Red Hat Display"),
                      ),
                      TextButton.icon(
                        onPressed: () async {
                          dynamic result =
                              await Navigator.pushNamed(context, '/location');
                          setState(() {
                            data = {
                              "time": result["time"],
                              "location": result["location"],
                              "isDaytime": result["isDaytime"],
                              "flag": result["flag"],
                            };
                          });
                        },
                        label: Text(
                          "Edit location",
                          style: TextStyle(color: colorScheme.onSurface),
                        ),
                        icon: Icon(
                          Icons.edit_location_alt,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 260.0,
                  right: 20.0,
                  child: Image.asset(
                    'assets/$backgroundImage',
                    width: 50.0,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/everest.png',
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: colorScheme.inverseSurface,
            onPressed: () async {
              dynamic result = await Navigator.pushNamed(context, '/location');
              setState(() {
                data = {
                  "time": result["time"],
                  "location": result["location"],
                  "isDaytime": result["isDaytime"],
                  "flag": result["flag"],
                };
              });
            },
            child: Icon(Icons.edit_location_alt,
                color: colorScheme.onInverseSurface),
          ),
        );
      },
    );
  }
}
