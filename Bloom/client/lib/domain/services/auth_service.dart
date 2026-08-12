abstract class AuthService {
  Future<String?> getCurrentUserId();
  Future<void> signInWithEmail(String email, String password);
  Future<void> signUpWithEmail(String email, String password);
  Future<void> resetPassword(String email);
  Future<void> signOut();
  Future<void> signOutAllDevices();
  Future<void> deleteAccount();

  // Exposes a stream of the user ID (null if signed out)
  Stream<String?> get authStateChanges;
}
