# battery_level

A new Flutter project.

## Calling platform-specific code using platform channels

The following code demonstrates how to call a platform-specific API to retrieve and display the current battery level. It uses the Android BatteryManager API, the iOS device.batteryLevel API, the Windows GetSystemPowerStatus API, and the Linux UPower API with a single platform message, getBatteryLevel().

The example adds the platform-specific code inside the main app itself. If you want to reuse the platform-specific code for multiple apps, the project creation step is slightly different (see [developing packages](https://docs.flutter.dev/packages-and-plugins/developing-packages#plugin)), but the platform channel code is still written in the same way.

### Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
