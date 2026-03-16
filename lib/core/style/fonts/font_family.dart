import 'package:my_store/core/services/shared_pref/share_keys.dart';
import 'package:my_store/core/services/shared_pref/share_pref.dart';

class FontFamily {
  const FontFamily._();

  static const String cairoArabic = 'Cairo';
  static const String poppinsEnglish = 'Poppins';

  static String getFontFamilyByLocale(String locale) {
    final currentlang = SharedPref().getString(ShareKeys.language);
    if (currentlang == 'ar') {
      return cairoArabic;
    } else {
      return poppinsEnglish;
    }
  }
}
