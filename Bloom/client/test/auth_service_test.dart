import 'package:flutter_test/flutter_test.dart';
import 'package:bloom_client/domain/services/auth_service.dart';
import 'package:bloom_client/data/services/mock_auth_service.dart';

void main() {
  group('[UNIT TEST] AuthService Contract & MockAuthService In-Memory State Tests', () {
    late AuthService authService;

    setUp(() {
      authService = MockAuthService();
    });

    test('Initial auth state should be signed out (null)', () async {
      final userId = await authService.getCurrentUserId();
      expect(userId, isNull);
    });

    test('signInWithEmail should transition auth state to signed in', () async {
      expect(authService.authStateChanges, emitsInOrder([isNull, equals('1')]));
      await authService.signInWithEmail('test@bloom.com', 'password123');
      final userId = await authService.getCurrentUserId();
      expect(userId, equals('1'));
    });

    test('signOut should clear current user session', () async {
      await authService.signInWithEmail('test@bloom.com', 'password123');
      expect(await authService.getCurrentUserId(), equals('1'));

      await authService.signOut();
      expect(await authService.getCurrentUserId(), isNull);
    });

    test('signOutAllDevices should clear session', () async {
      await authService.signInWithEmail('test@bloom.com', 'password123');
      expect(await authService.getCurrentUserId(), equals('1'));

      await authService.signOutAllDevices();
      expect(await authService.getCurrentUserId(), isNull);
    });
  });
}
