library kitx_moblie.config;

import 'package:flutter_logs/flutter_logs.dart';

class Config {
  static const String WebServer_UdpBroadcastAddress = "224.0.0.0";
  static const int WebServer_UdpPortReceive = 24040;
  static const int WebServer_UdpPortSend = 23404;
  static const int WebServer_DeviceInfoCheckTTLSeconds = 5;
  static const int WebServer_DeviceInfoTTLSeconds = 5;
  static const int WebServer_DeviceOSType = 1;
  static const List<LogLevel> Log_LogLevelsEnabled= [
    LogLevel.INFO,
    LogLevel.WARNING,
    LogLevel.ERROR,
    LogLevel.SEVERE,
  ];
  static const TimeStampFormat Log_TimeStampFormat = TimeStampFormat.TIME_FORMAT_FULL_2;
  static const DirectoryStructure Log_DirectoryStructure = DirectoryStructure.FOR_DATE;
  static const List<String> Log_LogTypesEnabled = [
    "network",
    "info",
    "errors",
  ];
  static const LogFileExtension Log_LogFileExtension = LogFileExtension.LOG;
  static const String Log_LogsWriteDirectoryName = "Logs";
  static const String Log_LogsExportDirectoryName = "Logs/Exported";
  static const bool Log_DebugFileOperations = true;
  static const bool Log_IsDebuggable = true;
}
