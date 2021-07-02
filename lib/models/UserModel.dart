

import 'package:dataclass/dataclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:techsmate/models/Login.dart';

class UserModel extends ChangeNotifier {
  final List<User> _user = [];
  UnmodifiableListView<User> get users => UnmodifiableListView(_user);

  void add(User user){
    _user.add(user);
    notifyListeners();
  }
}