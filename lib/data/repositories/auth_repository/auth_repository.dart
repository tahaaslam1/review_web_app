enum AuthenticationStatus { unknown, authenticated, unauthenticated }

abstract class AuthRepository {
  Stream<AuthenticationStatus> get status;
  Future<void> signOut();
  Future<String> signUp(String firstname, String lastname, String organisation, String phone, String country, String email, String password);
  Future<void> login(String email, String password);
  //Future<bool> userAlreadyExists({required String email});
  Future<bool> isSignedIn();
  void dispose();
}
