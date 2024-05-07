import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isBluetoothEnabled = false;

  @override
  void initState() {
    super.initState();
    checkBluetoothStatus();
  }

  Future<void> checkBluetoothStatus() async {
    try {
      final bool isEnabled = await BleManager.isBluetoothEnabled();
      setState(() {
        isBluetoothEnabled = isEnabled;
      });
    } catch (e) {
      print('Error checking Bluetooth status: $e');
    }
  }

  Future<void> enableBluetooth() async {
    try {
      await BleManager.enableBluetooth();
      // Rafraîchir l'état après avoir activé le Bluetooth
      await checkBluetoothStatus();
    } catch (e) {
      print('Error enabling Bluetooth: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: enableBluetooth,
              child: Text('Enable Bluetooth'),
            ),
            SizedBox(height: 20),
            Text(
              'Bluetooth Status:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              isBluetoothEnabled ? 'Enabled' : 'Disabled',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isBluetoothEnabled ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class BleManager {
  static const MethodChannel _channel = MethodChannel('ble_manager');

  static Future<void> enableBluetooth() async {
    try {
      await _channel.invokeMethod('enableBluetooth');
    } catch (e) {
      print('Error enabling Bluetooth: $e');
    }
  }

  static Future<bool> isBluetoothEnabled() async {
    try {
      final bool isEnabled = await _channel.invokeMethod('isBluetoothEnabled');
      return isEnabled;
    } catch (e) {
      print('Error checking Bluetooth status: $e');
      return false;
    }
  }
}

