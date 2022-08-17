abstract class StorageService {
  Future<void> init();

  Future<void> set(String? key, dynamic data);

  // dynamic get(dynamic key);

  Future<void> clear();

  Future<void> delete(String key);

  Future<void> close();
}
