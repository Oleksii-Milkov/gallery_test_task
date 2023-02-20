class Urls {
  late String full;
  late String small;

  Urls({
    required this.full,
    required this.small,
  });

  Urls.fromJson(Map<String, dynamic> json) {
    full = json['full'];
    small = json['small'];
  }
}