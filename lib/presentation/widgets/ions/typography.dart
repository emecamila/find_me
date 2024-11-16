part of 'ions.dart';

class TypoTitle {
  static TextStyle size96 = _base.copyWith(fontSize: 96, height: 104 / 96);
  static TextStyle size72 = _base.copyWith(fontSize: 72, height: 80 / 72);
  static TextStyle size32 = _base.copyWith(fontSize: 32, height: 40 / 32);
  static TextStyle size24 = _base.copyWith(fontSize: 24, height: 32 / 24);
  static TextStyle size16 = _base.copyWith(fontSize: 16, height: 24 / 16);

  static TextStyle get _base => GoogleFonts.notoSans(
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      ).copyWith(
        color: FMColors.black100,
      );
}

class TypoBody {
  static TextStyle size16 = _base.copyWith(fontSize: 16);
  static TextStyle size14 = _base.copyWith(fontSize: 14);

  static TextStyle get _base => GoogleFonts.notoSans(
        letterSpacing: 0,
      ).copyWith(
        color: FMColors.black100,
      );
}
