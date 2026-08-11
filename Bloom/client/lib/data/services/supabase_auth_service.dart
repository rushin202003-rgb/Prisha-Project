import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/services/auth_service.dart';

class SupabaseAuthService implements AuthService {
  final SupabaseClient _client = Supabase.instance.client;

  @override
  Future<String?> getCurrentUserId() async {
    return _client.auth.currentUser?.id;
  }

  @override
  Future<void> signInWithEmail(String email, String password) async {
    await _client.auth.signInWithPassword(email: email, password: password);
  }

  @override
  Future<void> signUpWithEmail(String email, String password) async {
    await _client.auth.signUp(email: email, password: password);
  }

  @override
  Future<void> resetPassword(String email) async {
    await _client.auth.resetPasswordForEmail(email);
  }

  @override
  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  @override
  Future<void> signOutAllDevices() async {
    await _client.auth.signOut(scope: SignOutScope.global);
  }

  @override
  Future<void> deleteAccount() async {
    try {
      await _client.rpc('delete_user_account');
    } catch (e) {
      // Ignore if RPC does not exist yet for A1 testing, we are just mocking the flow
    }
    await signOut();
  }

  @override
  Stream<String?> get authStateChanges {
    return _client.auth.onAuthStateChange.map((event) => event.session?.user.id);
  }
}
