import '../config.dart';

extension FlavorExtFromString on String? {
  Flavor get flavor {
    switch (this) {
      case 'dev':
        return Flavor.dev;
      case 'staging':
        return Flavor.staging;
      default:
        return Flavor.prod;
    }
  }
}

extension StringExt on String {
  bool get cash => this == 'THB';
  String get group => cash ? 'Cash' : 'Crypto';
}
