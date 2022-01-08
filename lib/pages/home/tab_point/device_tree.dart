class DeviceTree {
  final String? deviceId = null;
  final String? deviceName = null;
  final String? ImageUri = null;
  final bool? isChild = null;
  List<DeviceTree>? deviceTreeChild = null;

  DeviceTree(String? deviceId, String deviceName, String ImageUri,
      List<DeviceTree> deviceTreeChild);
}
