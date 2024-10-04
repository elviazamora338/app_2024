// import 'package:app_swe2024/models/user_info.dart';
// import 'package:app_swe2024/models/tasks_info.dart';

// class GroupInfo {
//   final int groupId;
//   final String name;
//   // A group has many users
//   final List<UserInfo> members; 
//   // A group can have many tasks
//   final List<TaskInfo> tasks;   

//   GroupInfo({
//     required this.groupId,
//     required this.name,
//     required this.members,
//     required this.tasks,
//   });

//   factory GroupInfo.fromJson(Map<String, dynamic> json) {
//     var memberList = (json['Members'] as List)
//         .map((user) => UserInfo.fromJson(user))
//         .toList();
//     var taskList = (json['Tasks'] as List)
//         .map((task) => TaskInfo.fromJson(task))
//         .toList();

//     return GroupInfo(
//       groupId: json['GroupId'],
//       name: json['Name'],
//       members: memberList,
//       tasks: taskList,
//     );
//   }
// }
