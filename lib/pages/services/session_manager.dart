class SessionManager {
  static final SessionManager _instance = SessionManager._internal();

  String? _userId;

  factory SessionManager() {
    return _instance;
  }

  SessionManager._internal();

  void setUserId(String userId) {
    _userId = userId;
  }

  String? get userId => _userId;

  void clear() {
    _userId = null;
  }
}
