import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';

class CheckInternetWidget extends StatefulWidget {
  final Widget widget;
  // Pass your dispatch/.add() bloc here
  final Function func;

  const CheckInternetWidget({Key key, this.widget, this.func})
      : super(key: key);

  @override
  _CheckInternetWidgetState createState() => _CheckInternetWidgetState();
}

class _CheckInternetWidgetState extends State<CheckInternetWidget> {
  static const Duration DEFAULT_INTERVAL = const Duration(seconds: 1);
  Duration checkInterval = DEFAULT_INTERVAL;

  bool isConnected;
  bool hasDisconnectedEarlier;
  bool alreadyDispatchedFetch;
  bool alreadyShownError;
  bool alreadyShownSuccess;
  @override
  void initState() {
    super.initState();
    _setConnectionStatus();
  }

  @override
  Widget build(BuildContext context) {
    DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          if (!alreadyDispatchedFetch) {
            // _bloc.add(FetchNews());
            widget.func();
          }
          if (hasDisconnectedEarlier && !alreadyShownSuccess) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(
                'You are connected to the internet',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
            ));
            setState(() {
              isConnected = true;
              alreadyDispatchedFetch = true;
              // Resets the bool value into false.
              alreadyShownError = false;
              alreadyShownSuccess = true;
            });
          }
          break;
        case DataConnectionStatus.disconnected:
          if (alreadyShownError == false) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(
                'You are disconnected from the internet',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ));
          }
          setState(() {
            isConnected = false;
            hasDisconnectedEarlier = true;
            alreadyShownError = true;
            alreadyShownSuccess = false;
          });
          break;
      }
    });

    return (isConnected ?? false)
        ? widget.widget
        : Container(
            child: Center(
              child: Text('You have no internet connection.'),
            ),
          );
  }

  _setConnectionStatus() async {
    if (await DataConnectionChecker().hasConnection) {
      setState(() {
        isConnected = true;
        hasDisconnectedEarlier = false;
        widget.func();
        alreadyDispatchedFetch = true;
        alreadyShownError = false;
      });
    } else {
      setState(() {
        isConnected = false;
        hasDisconnectedEarlier = true;
        alreadyDispatchedFetch = false;
        alreadyShownSuccess = false;
      });
    }
  }
}
