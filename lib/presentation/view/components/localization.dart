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
        'en_US': {
          'edit': 'Edit',
          'register': 'egister',
          'fullName': 'Full Name',
          'gender': 'Gender',
          'male': 'Male',
          'female': 'Female',
          'birthDate': 'Birth Date',
          'phoneNumber': 'Phone Number',
          'password': 'Password',
          'confirm': 'Confirm',
          'next': 'Next',
          'update': 'Update',
          'termsCondition': 'Terms and Conditions',
          'ratingReview': 'Rating and Review',
          'aboutUs': 'About Us',
          'view': 'View',
          'search': 'Search',
          'all': 'All',
          'glossary': 'Glossary',
          'material': 'Materials',
          'article': 'Article',
          'keyword': 'Type keywords ...',
          'message': 'Send a message...',
          'start': 'START',
          'loading': 'Loading...'
        },
        'id_ID': {
          'edit': 'Ubah',
          'register': 'Daftar',
          'fullName': 'Nama Lengkap',
          'gender': 'Jenis Kelamin',
          'male': 'Laki-laki',
          'female': 'Perempuan',
          'birthDate': 'Tanggal Lahir',
          'phoneNumber': 'Nomor Telepon',
          'password': 'Kata Sandi',
          'confirm': 'Konfirmasi',
          'next': 'Lanjutkan',
          'update': 'Memperbarui',
          'termsCondition': 'Syarat dan Ketentuan',
          'ratingReview': 'Penilaian dan Tinjauan',
          'aboutUs': 'Tentang Kami',
          'view': "Lihat",
          'search': 'Cari',
          'all': 'Semua',
          'glossary': 'Kamus',
          'material': 'Materi',
          'article': 'Artikel',
          'keyword': 'Tulis kata kunci ...',
          'message': 'Kirim pesan...',
          'start': 'MULAI',
          'loading': 'Memuat Data...'
        },
      };
  static Future<void> loadSavedLanguage() async {
    final savedLang = await _storage.read(key: _storageKey);
    // if (savedLang != null && langs.contains(savedLang)) {
    //   changeLocale(savedLang);
    // }
    if (savedLang == null || !langs.contains(savedLang)) {
      await _storage.write(key: _storageKey, value: 'English');
      changeLocale('English'); // Set ke bahasa default
    } else {
      changeLocale(savedLang); // Set ke bahasa yang disimpan
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
