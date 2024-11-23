// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  static const locale = Locale('en', 'US');
  static const fallbackLocale = Locale('en', 'US');
  static const _storageKey = 'selected_language';
  static const _storage = FlutterSecureStorage();

  static final langs = [
    'English',
    'Indonesia',
  ];

  static final locales = [
    const Locale('en', 'US'),
    const Locale('id', 'ID'),
  ];

  static final currentLang = 'English'.obs;

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {'edit': 'Edit', 'register': 'egister', 'fullName': 'Full Name', 'gender': 'Gender', 'male': 'Male', 'female': 'Female', 'birthDate': 'Birth Date'},
        'id_ID': {'edit': 'Ubah'},
      };
  static Future<void> loadSavedLanguage() async {
    final savedLang = await _storage.read(key: _storageKey);
    if (savedLang != null && langs.contains(savedLang)) {
      changeLocale(savedLang);
    }
  }

  static void changeLocale(String lang) async {
    final locale = _getLocaleFromLanguage(lang);
    currentLang.value = lang;
    Get.updateLocale(locale);
    await _storage.write(key: _storageKey, value: lang);
  }

  static Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }
}
