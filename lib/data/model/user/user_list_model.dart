import 'user_model.dart';


class UserListModel {
  final List<UserModel> list;

  UserListModel({
    required this.list,
  });

  factory UserListModel.fromJson(List<dynamic> parsedJson) {
    List<UserModel> list = <UserModel>[];
    list = parsedJson.map((i) => UserModel.fromJson(i)).toList();

    return UserListModel(list: list);
  }
}
