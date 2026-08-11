abstract class AuthService {
  Future<String?> getCurrentUserId();
  Future<void> signInWithEmail(String email, String password);
  Future<void> signOut();
  Future<void> deleteAccount();
  
  // Exposes a stream of the user ID (null if signed out)
  Stream<String?> get authStateChanges;
}
