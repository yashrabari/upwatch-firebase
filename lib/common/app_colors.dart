import '../../../common/all.dart';

/// Enter your app primer color code in opacity ----->>
/// NOTE: Don't change opacity code just change color code -------->>
Map<int, Color> textColor = {
  50: const Color(0x1a01CDCE),
  100: const Color(0x2601CDCE),
  200: const Color(0x3301CDCE),
  300: const Color(0x4d01CDCE),
  400: const Color(0x6601CDCE),
  500: const Color(0x8001CDCE),
  600: const Color(0x9901CDCE),
  700: const Color(0xb301CDCE),
  800: const Color(0xcc01CDCE),
  900: const Color(0xe601CDCE),
};

class AppColors {
  /// Enter your app primer color code ----->>
  static MaterialColor primerColor = MaterialColor(0x8001CDCE, textColor);

  ///************** Common Color **************///
  /// NOTE: DO not remove this colors -------->>>
  Color black = const Color(0xFF000000);
  Color white = const Color(0xFFFFFFFF);
  Color yellow = const Color(0xFFEEC829);
  Color yellowInRoute = const Color(0xFFF7EE1B);
  Color red = const Color(0xFFFF0025);
  Color grey = const Color(0xFF707070);
  Color transparent = const Color(0x00000000);
  Color suffixIconColor = const Color(0xFF30CC52);
  Color textColors = const Color(0xFF9B9B9B);

  Color themeColor = const Color(0xFF01CDCE);
  Color buttonBackGroundColor = const Color(0xFF303952);
  Color textFieldBackGroundColor = const Color(0xFFF8F8F8);
  Color borderColor = const Color(0xFFD9DBE0);

  Color expertiseBackColor = const Color(0xFFD8EFFF);
  Color expertiseTextColor = const Color(0xFF005591);
  Color budgeColor = const Color(0xFFDB0909);

  Color receiverBackColor = const Color(0xFFE6FFFF);
  Color seperatorColor = const Color(0xFFE0E1E4);

  Color appOrange1 = Color(0xFFF7B733);
  Color appGray = Color(0xFFD4D4D4);
  Color appOrange2 = const Color(0xFFFC4A1A);
  Color appOrangeFont = const Color(0xFFFC4A1A); //0xfff94646
  Color appText = const Color(0xFF020233);
  Color btnStart = HexColor.fromHex('#F7B733');
  Color btnEnd = HexColor.fromHex('#FC4A1A');
  Color btnFb = HexColor.fromHex('#92B2F4');
  Color btnGoogle = HexColor.fromHex('#F14336');

  static List<Color> gradiantColor = [
    Color(0xFFF7B733),
    Color(0xFFFC4A1A),
  ];
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
