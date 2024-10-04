import 'dart:typed_data';
import 'package:app_swe2024/models/group_info.dart';
import 'package:app_swe2024/models/tasks_info.dart';

class UserInfo {
  final String username;
  final String password;
  final String email;
  // final List<GroupInfo> groups; // A user can belong to many groups
  // final List<TaskInfo> tasks;   // A user can create multiple tasks

  UserInfo({
    required this.username,
    required this.password,
    required this.email,
    // required this.groups,
    // required this.tasks,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    // var groupList = (json['Groups'] as List)
    //     .map((group) => GroupInfo.fromJson(group))
    //     .toList();
    // var taskList = (json['Tasks'] as List)
    //     .map((task) => TaskInfo.fromJson(task))
    //     .toList();

    return UserInfo(
      username: json['Username'],
      password: json['Password'],
      email: json['Email'],
      // groups: groupList,
      // tasks: taskList,
    );
  }
}
