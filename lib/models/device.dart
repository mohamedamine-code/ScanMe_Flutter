// models/device_info.dart
class DeviceInfo {
  final String id;
  final String societyName;
  final String numberOfFloors;
  final String technicalRoomNumber;
  final String cabinetNumber;
  final String switcher;
  final String port;
  final bool statePort;


  DeviceInfo({
    required this.id,
    required this.societyName,
    required this.numberOfFloors,
    required this.technicalRoomNumber,
    required this.cabinetNumber,
    required this.switcher,
    required this.port,
    required this.statePort,

  });

  factory DeviceInfo.fromJson(Map<String, dynamic> json) {
    return DeviceInfo(
      id: json['_id'] ?? '',
      societyName: json['Society_Name'] ?? '',
      numberOfFloors: json['Number_of_Floors'] ?? '',
      technicalRoomNumber: json['Technical_Room_Number'] ?? '',
      cabinetNumber: json['Cabinet_Number'] ?? '',
      switcher: json['Switcher'] ?? '',
      port: json['Port'] ?? '',
      statePort: json['State_Port'] ?? false,
    );
  }
}