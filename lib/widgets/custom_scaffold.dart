import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:flutter_project/screens/drawer/sidemenu.dart';
import 'package:flutter_project/theme/theme_notifier.dart';

class CustomScaffold extends StatefulWidget {
  final Widget? child;

  const CustomScaffold({Key? key, this.child}) : super(key: key);

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  ConnectivityResult? _connectionStatus;
  ConnectivityResult? _lastConnectionStatus;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _subscription;
  bool _isFirstCheck = true;

  @override
  void initState() {
    super.initState();
    _checkConnection();
    _subscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  Future<void> _checkConnection() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    _updateConnectionStatus(result, initialCheck: true);
  }

  void _updateConnectionStatus(ConnectivityResult result, {bool initialCheck = false}) {
    setState(() {
      if (_connectionStatus != result || initialCheck) {
        _lastConnectionStatus = _connectionStatus;
        _connectionStatus = result;
        if (!initialCheck && _lastConnectionStatus == ConnectivityResult.none && _connectionStatus != ConnectivityResult.none) {
          _showToast(result);
        }
      }
      _isFirstCheck = false;
    });
  }

  void _showToast(ConnectivityResult result) {
    String message;
    if (result == ConnectivityResult.mobile) {
      message = "Connected to Mobile Internet";
    } else if (result == ConnectivityResult.wifi) {
      message = "Connected to WiFi";
    } else {
      // Return early if the result is not a connection
      return;
    }
    Fluttertoast.showToast(msg: message);
  }

  @override
  Widget build(BuildContext context) {
    if (_connectionStatus == null) {
      return const LoadingScreen();
    } else if (_connectionStatus == ConnectivityResult.none) {
      return NoInternetScreen(refreshCallback: _checkConnection);
    } else {
      return Scaffold(
        drawer: SideMenu(),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Consumer<ThemeNotifier>(
              builder: (context, themeNotifier, child) {
                return Image.asset(
                  'assets/images/bg1.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  color: themeNotifier.getTheme().brightness == Brightness.dark
                      ? Colors.black.withOpacity(0.6)
                      : Colors.white.withOpacity(0.6),
                  colorBlendMode: BlendMode.darken,
                );
              },
            ),
            widget.child ?? Container(),
          ],
        ),
      );
    }
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class NoInternetScreen extends StatelessWidget {
  final VoidCallback refreshCallback;

  const NoInternetScreen({Key? key, required this.refreshCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("No Internet Connection"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: refreshCallback,
          child: const Text("Retry"),
        ),
      ),
    );
  }
}
