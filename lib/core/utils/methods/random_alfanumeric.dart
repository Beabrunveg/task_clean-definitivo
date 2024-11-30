import 'dart:math';
/// Generate a random alphanumeric code.
String generateAlphanumericCode(int longitud) {
  const chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random();

  return List.generate(longitud, (index) => chars[random.nextInt(chars.length)])
      .join();
}
