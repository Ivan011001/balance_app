import 'dart:math';

class Converter {
  static BigInt fromHex(String hexValue) {
    return BigInt.parse(hexValue.substring(2), radix: 16);
  }

  static String toWei(double etherAmount) {
    return BigInt.from(etherAmount * pow(10, 18)).toString();
  }

  static String fromWei(BigInt weiAmount) {
    return (weiAmount / BigInt.from(pow(10, 18))).toString();
  }
}
