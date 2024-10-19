// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  late final _$usersAtom = Atom(name: '_UserStore.users', context: context);

  @override
  ObservableList<UserModel> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(ObservableList<UserModel> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  late final _$visitorsAtom =
      Atom(name: '_UserStore.visitors', context: context);

  @override
  ObservableList<UserModel> get visitors {
    _$visitorsAtom.reportRead();
    return super.visitors;
  }

  @override
  set visitors(ObservableList<UserModel> value) {
    _$visitorsAtom.reportWrite(value, super.visitors, () {
      super.visitors = value;
    });
  }

  late final _$fetchUsersAsyncAction =
      AsyncAction('_UserStore.fetchUsers', context: context);

  @override
  Future<void> fetchUsers() {
    return _$fetchUsersAsyncAction.run(() => super.fetchUsers());
  }

  late final _$_UserStoreActionController =
      ActionController(name: '_UserStore', context: context);

  @override
  void updatePayment(UserModel user, String method, double amount) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.updatePayment');
    try {
      return super.updatePayment(user, method, amount);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addVisitor() {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.addVisitor');
    try {
      return super.addVisitor();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearAllData() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.clearAllData');
    try {
      return super.clearAllData();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
users: ${users},
visitors: ${visitors}
    ''';
  }
}
