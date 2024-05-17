import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/* The app's State class holds the current app state. Extend that to hold the current battery state. */

/* First, construct the channel. Use a MethodChannel with a single platform method that returns the battery level. */

/* The client and host sides of a channel are connected through a channel name passed in the channel constructor. 
All channel names used in a single app must be unique; prefix the channel name with a unique 'domain prefix', for example: 
samples.flutter.dev/battery. */

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  static const platform = MethodChannel('samples.flutter.dev/battery');
  
  /* Next, invoke a method on the method channel, specifying the concrete method to call using the String identifier 
  getBatteryLevel. The call might fail—for example, if the platform doesn't support the platform API (such as when running 
  in a simulator), so wrap the invokeMethod call in a try-catch statement. */

  /* Use the returned result to update the user interface state in _batteryLevel inside setState. */

  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  /* Finally, replace the build method from the template to contain a small user interface that displays the battery state 
  in a string, and a button for refreshing the value. */

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Battery Level', style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold)),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _getBatteryLevel,
                child: Text('Get Battery Level'),
              ),
              Text(_batteryLevel),
            ],
          ),
        ),
      ),
    );
  }
}
