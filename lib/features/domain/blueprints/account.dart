abstract class AccountRepoBlueprint {
  Future<void> login(Map<String, dynamic> data);

  Future<void> signup(Map<String, dynamic> data);

  Future<void> fetchUsers();

  int randomizer();
}