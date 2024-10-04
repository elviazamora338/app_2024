// import 'dart:typed_data';
// import 'package:app_swe2024/models/group_info.dart';
// import 'package:app_swe2024/models/user_info.dart';

// class TaskInfo {
//   final int id;
//   final String name;
//   final String location;
//   final String time;
//   // Blob data for task images
//   final Uint8List? photos; 
//   // User who created the task
//   final UserInfo creator; 
//   // The group the task belongs to 
//   final GroupInfo group;  

//   TaskInfo({
//     required this.id,
//     required this.name,
//     required this.location,
//     required this.time,
//     this.photos,
//     required this.creator,
//     required this.group,
//   });

//   factory TaskInfo.fromJson(Map<String, dynamic> json) {
//     return TaskInfo(
//       id: json['Id'],
//       name: json['Name'],
//       location: json['Location'],
//       time: json['Time'],
//       photos: json['Photos'] != null ? Uint8List.fromList(List<int>.from(json['Photos'])) : null,
//       creator: UserInfo.fromJson(json['Creator']),
//       group: GroupInfo.fromJson(json['Group']),
//     );
//   }
// }
