// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';

// class ConnectivityService {
//   final Connectivity _connectivity = Connectivity();

//   // Stream controller for connectivity changes
//   StreamController<ConnectivityStatus> connectionStatusController =
//       StreamController<ConnectivityStatus>.broadcast();

//   // Initialize the service
//   Future<void> initialize() async {
//     // Get the initial connectivity status
//     ConnectivityResult result = await _connectivity.checkConnectivity();
//     _updateConnectionStatus(result);

//     // Listen for connectivity changes
//     _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//   }

//   // Update the connection status based on connectivity result
//   void _updateConnectionStatus(ConnectivityResult result) {
//     switch (result) {
//       case ConnectivityResult.wifi:
//       case ConnectivityResult.mobile:
//       case ConnectivityResult.ethernet:
//         connectionStatusController.add(ConnectivityStatus.connected);
//         break;
//       default:
//         connectionStatusController.add(ConnectivityStatus.disconnected);
//         break;
//     }
//   }

//   // Dispose of resources
//   void dispose() {
//     connectionStatusController.close();
//   }
// }

// // Define connectivity status enum
// enum ConnectivityStatus { connected, disconnected }
