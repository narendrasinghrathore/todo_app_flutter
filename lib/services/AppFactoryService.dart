import 'package:todo_app_flutter/services/firebase/auth.service.dart';

class AppFactoryService {
  static AuthFirebase get appFirebaseAuth {
    return AuthFirebase();
  }
}
