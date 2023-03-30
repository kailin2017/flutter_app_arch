import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../generated/l10n.dart';

enum L10N { en, zh_CN, zh_TW }

extension L10Ex on L10N {
  Locale get locale {
    switch (this) {
      case L10N.zh_TW:
        return Locale(L10N.zh_TW.name);
      case L10N.zh_CN:
        return Locale(L10N.zh_CN.name);
      case L10N.en:
        return Locale(L10N.en.name);
    }
  }
}

class LocaleHelper {
  LocaleHelper._();

  factory LocaleHelper() => _instance;

  static final _instance = LocaleHelper._();

  S localizations(BuildContext context) => S.of(context);

  Iterable<LocalizationsDelegate<dynamic>> get delegates =>
      const [S.delegate, GlobalMaterialLocalizations.delegate];

  Locale ofLocale(String code) {
    L10N l10n;
    try {
      l10n = L10N.values.byName(code);
    } catch (e) {
      l10n = L10N.en;
    }
    return l10n.locale;
  }
}
