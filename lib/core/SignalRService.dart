/*
import 'package:signalr_netcore/signalr_client.dart';

class SignalRService {
  late HubConnection _hubConnection;

  Future<void> initConnection() async {
    final serverUrl = "https://your-api.com/hub/emergency";

    _hubConnection = HubConnectionBuilder()
        .withUrl(serverUrl)
        .withAutomaticReconnect()
        .build();

    // listener lma el server yb3t message
    _hubConnection.on("ReceiveEmergencyStatus", _handleEmergencyStatus);

    // connect
    await _hubConnection.start();
    print("SignalR connected ✅");
  }

  void _handleEmergencyStatus(List<Object>? arguments) {
    print("New status received: $arguments");
    // you can update the UI or notify the cubit here
  }

  Future<void> stopConnection() async {
    await _hubConnection.stop();
  }
}
*/
