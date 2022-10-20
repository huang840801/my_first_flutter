import 'dart:convert';
import 'package:crypto/crypto.dart';

String encrypt(String input) {
  final part1 = md5.convert(utf8.encode(input)).toString();
  final part2 = part1.substring(3, 3 + 16);
  final part3 = sha1.convert(utf8.encode(part2)).toString();
  final part4 = part3.substring(4, 4 + 14);

  return part4;
}
