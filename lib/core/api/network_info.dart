import 'package:internet_connection_checker/internet_connection_checker.dart';

/// Abstract class for network connectivity information.
///
/// This class defines the methods for checking network connection status and
/// monitoring connectivity changes.
abstract class NetworkInfo {
  /// Returns a [Future] that completes with `true` if there is an active network
  /// connection, and `false` otherwise.
  ///
  /// This method provides a way to check the current network connectivity status.
  Future<bool> get isConnected;

  /// Returns a [Stream] that emits [InternetConnectionStatus] events when the
  /// network connectivity status changes.
  ///
  /// This method allows for real-time monitoring of network connectivity changes.
  /// Subscribers to this stream will receive updates whenever the network status
  /// changes.
  Stream<InternetConnectionStatus> checkConnection();
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker _connectionChecker;

  /// Creates an instance of [NetworkInfoImpl] with the specified [InternetConnectionChecker].
  ///
  /// This implementation uses the [InternetConnectionChecker] package to
  /// check and monitor network connectivity.
  ///
  /// Parameters:
  /// - [_connectionChecker]: An instance of [InternetConnectionChecker] used
  /// to check and monitor network connectivity.
  const NetworkInfoImpl(this._connectionChecker);

  @override
  Future<bool> get isConnected async => await _connectionChecker.hasConnection;

  @override
  Stream<InternetConnectionStatus> checkConnection() {
    return _connectionChecker.onStatusChange;
  }
}

/// Exception thrown when there is an issue with network connectivity.
///
/// This exception can be used to indicate various network-related problems
/// such as no internet connection or connectivity issues.
class NetworkException implements Exception {
  /// Creates an instance of [NetworkException].
  ///
  /// This exception does not require any parameters.
  const NetworkException();
}