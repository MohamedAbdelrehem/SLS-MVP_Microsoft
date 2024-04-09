import 'dart:async';

import 'package:flutter/material.dart';

class CarStatus extends StatefulWidget {
  const CarStatus({super.key, required this.timestamp});

  final String timestamp;

  @override
  State<CarStatus> createState() => _CarStatusState();
}

class _CarStatusState extends State<CarStatus> {
  String _previousTimestamp = '';
  int _isConnected = 0; // Initial assumption is connected
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _previousTimestamp = widget.timestamp;
    _timer = Timer.periodic(const Duration(seconds: 5), _updateDataSource);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isConnected == 2) {
      return Icon(Icons.error_outline, color: Colors.red);
    } else if (_isConnected == 1) {
      return Icon(Icons.wifi, color: Colors.green);
    } else if (_isConnected == 0) {
      return Icon(Icons.wifi_off, color: Colors.red);

      // return _isConnected ? const Icon(Icons.connected_tv_sharp) : const Icon(Icons.wifi_off);
    } else {
      return Text('something went wrong with variables');
    }
  }

  void _updateDataSource(Timer timer) {
    final String newTimestamp = widget.timestamp;
    print(
        'this is new timestamp $newTimestamp and this is old time timetamp $_previousTimestamp');
    if (newTimestamp == 'INVALID') {
      print('it entered invalid');
      _isConnected = 2;
    } else {
      if (newTimestamp != _previousTimestamp) {
        _previousTimestamp = newTimestamp;
        _isConnected = 1;
      } else {
        _isConnected = 0;
      }
    }
    setState(() {});
  }
}


// import 'dart:async';

// import 'package:flutter/material.dart';

// class CarStatus extends StatefulWidget {
//   const CarStatus({super.key, required this.timestamp});
// final String timestamp;
//   @override
//   State<CarStatus> createState() => _CarStatusState();
// }

// class _CarStatusState extends State<CarStatus> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//         Timer.periodic(const Duration(seconds: 1), updateDataSource);
//   }
//   @override
//   Widget build(BuildContext context) {

    
//   }
//     void updateDataSource(Timer timer) {

 
//   }

// }