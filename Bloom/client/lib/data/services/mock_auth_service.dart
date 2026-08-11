import 'dart:async';
import '../../domain/services/auth_service.dart';

class MockAuthService implements AuthService {
  final _authStateController = StreamController<String?>.broadcast();
  String? _currentUserId;

  MockAuthService() {
    // Start signed out by default
    _authStateController.add(null);
  }

  @override
  Future<String?> getCurrentUserId() async {
    return _currentUserId;
  }

  @override
  Future<void> signInWithEmail(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 600)); // Simulate API latency
    _currentUserId = '1'; // Log in as test student '1'
    _authStateController.add(_currentUserId);
  }

  @override
  Future<void> signUpWithEmail(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 800));
    _currentUserId = '1';
    _authStateController.add(_currentUserId);
  }

  @override
  Future<void> resetPassword(String email) async {
    await Future.delayed(const Duration(milliseconds: 400));
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 400));
    _currentUserId = null;
    _authStateController.add(null);
  }

  @override
  Future<void> signOutAllDevices() async {
    await signOut();
  }

  @override
  Future<void> deleteAccount() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _currentUserId = null;
    _authStateController.add(null);
  }

  @override
  Stream<String?> get authStateChanges async* {
    yield _currentUserId;
    yield* _authStateController.stream;
  }
}
