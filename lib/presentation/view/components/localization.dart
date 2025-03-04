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
          'register': 'Sign Up',
          'login' : 'Sign In',
          'fullName': 'Full Name',
          'gender': 'Gender',
          'male': 'Male',
          'female': 'Female',
          'birthDate': 'Birth Date',
          'phoneNumber': 'Phone Number',
          'password': 'Password',
          'confirm': 'Confirm',
          'next': 'Next',
          'to_regis' : 'Don\'t have an account? Register ',
          'to_login' : 'Already have an account? Login ',
          'here' : 'here',
          'profile': 'Profile',
          'account': 'Account',
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
          'score': 'Score',
          'score_eval': 'You get a score of',
          'try_again': 'Try again',
          'back_to_levels': 'Back to levels',
          'loading': 'Loading...',
          'welcome_chat': 'Welcome to the chatroom with our AI bot, Lingo.\n',
          'type': 'Type ',
          'start_chat_rule': ' to start chatting in English.\n',
          'rate_chat_rule': 'Ask Lingo to rate by typing ',
          'disclaimer': '\nNote: Lingo\'s rating is just a rough estimation and does not necessarily reflect your actual English proficiency!',
          'close': 'Close',
          'other': "Others",
          'loginText': 'New here? Register your account ',
          'here_text': 'here',
          'registerText': 'Already have an account? Login ',
          'course_locked' : 'Complete previous course with a minimum of',
          'point' : 'points',
          'practice_rule' : 'Obtain a minimum score of 30 for each to unlock next round of questions',
          'word_not_found': 'Word not found',
          'material_not_found' : 'Material not found',
          'source_not_found' : 'This could be due to a mistake in your search or the keyword may not exist'
        },
        'id_ID': {
          'edit': 'Ubah',
          'register': 'Daftar',
          'login' : 'Masuk',
          'fullName': 'Nama Lengkap',
          'gender': 'Jenis Kelamin',
          'male': 'Laki-laki',
          'female': 'Perempuan',
          'birthDate': 'Tanggal Lahir',
          'phoneNumber': 'Nomor Telepon',
          'password': 'Kata Sandi',
          'confirm': 'Konfirmasi',
          'next': 'Lanjutkan',
          'to_regis' : 'Belum punya akun? Daftar ',
          'to_login' : 'Sudah punya akun? Masuk ',
          'here' : 'disini',
          'profile': 'Profil',
          'account': 'Akun',
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
          'score': 'Skor',
          'score_eval': 'Anda mendapat skor',
          'try_again': 'Coba lagi',
          'back_to_levels': 'Balik ke halaman level',
          'loading': 'Memuat Data...',
          'welcome_chat': 'Selamat datang di ruang percakapan bersama bot AI, Lingo.\n',
          'type': 'Ketik ',
          'start_chat_rule': ' & mulai mengobrol dalam bahasa Inggris\n',
          'rate_chat_rule': 'Minta Lingo memberikan rating dengan ketik ',
          'disclaimer': '\nCatatan: Penilaian Lingo hanya perkiraan kasar & tidak mencerminkan kecakapan bahasa Inggris Anda yang sebenarnya!',
          'close': 'Tutup',
          'other': "Lainnya",
          'loginText': 'Pengguna baru? Registrasi akun ',
          'here_text': 'di sini',
          'registerText': 'Sudah punya akun? Login ',
          'course_locked' : 'Lengkapi kursus sebelumnya dengan minimum',
          'point' : 'poin',
          'practice_rule' : 'Dapatkan nilai minimum 30 untuk membuka rangkaian latihan berikutnya',
          'word_not_found': 'Kata tidak ditemukan',
          'material_not_found' : 'Materi tidak ditemukan',
          'source_not_found' : 'Terdapat kesalahan pada pencarian atau kata kunci tidak tersedia'
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
