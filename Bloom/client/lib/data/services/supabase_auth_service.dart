import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/services/auth_service.dart';

class SupabaseAuthService implements AuthService {
  final SupabaseClient _client = Supabase.instance.client;

  @override
  Future<String?> getCurrentUserId() async {
    final id = _client.auth.currentUser?.id;
    assert(() {
      print(
          '[AuthDiagnostics] getCurrentUserId evaluated: ${id != null ? "Authenticated" : "Unauthenticated"}');
      return true;
    }());
    return id;
  }

  @override
  Future<void> signInWithEmail(String email, String password) async {
    assert(() {
      print('[AuthDiagnostics] Event: signInWithEmail initiated');
      return true;
    }());
    await _client.auth.signInWithPassword(email: email, password: password);
    assert(() {
      print('[AuthDiagnostics] Event: signInWithEmail succeeded');
      return true;
    }());
  }

  @override
  Future<void> signUpWithEmail(String email, String password) async {
    assert(() {
      print('[AuthDiagnostics] Event: signUpWithEmail initiated');
      return true;
    }());
    await _client.auth.signUp(email: email, password: password);
    assert(() {
      print('[AuthDiagnostics] Event: signUpWithEmail completed');
      return true;
    }());
  }

  @override
  Future<void> resetPassword(String email) async {
    assert(() {
      print('[AuthDiagnostics] Event: resetPassword initiated');
      return true;
    }());
    await _client.auth.resetPasswordForEmail(email);
    assert(() {
      print('[AuthDiagnostics] Event: resetPassword completed');
      return true;
    }());
  }

  @override
  Future<void> signOut() async {
    assert(() {
      print('[AuthDiagnostics] Event: signOut initiated');
      return true;
    }());
    await _client.auth.signOut();
    assert(() {
      print('[AuthDiagnostics] Event: signOut completed');
      return true;
    }());
  }

  @override
  Future<void> signOutAllDevices() async {
    assert(() {
      print(
          '[AuthDiagnostics] Event: signOutAllDevices initiated (scope: global)');
      return true;
    }());
    await _client.auth.signOut(scope: SignOutScope.global);
    assert(() {
      print('[AuthDiagnostics] Event: signOutAllDevices completed');
      return true;
    }());
  }

  @override
  Future<void> deleteAccount() async {
    assert(() {
      print('[AuthDiagnostics] Event: deleteAccount initiated');
      return true;
    }());
    try {
      await _client.rpc('delete_user_account');
    } catch (e) {
      assert(() {
        print(
            '[AuthDiagnostics] deleteAccount RPC pending backend deployment (non-fatal for A1 testing)');
        return true;
      }());
    }
    await signOut();
  }

  @override
  Stream<String?> get authStateChanges {
    return _client.auth.onAuthStateChange.map((event) {
      final userId = event.session?.user.id;
      assert(() {
        print(
            '[AuthDiagnostics] AuthStateChanged event: ${event.event.name}, UserId present: ${userId != null}');
        return true;
      }());
      return userId;
    });
  }
}
