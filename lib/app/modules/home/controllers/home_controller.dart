import 'package:get/get.dart';
import 'package:valbury_test_app/app/models/hospital.dart';

class HomeController extends GetxController {
  final selectedIndex = 'semua'.obs;

  final selectedIndexKlinik = 'semua'.obs;

  // dummy data
  final hospitalDetail = [
    {'name': 'Fatmawati', 'alamat': 'Alamatnya 1', 'code': 'bp', 'image': 'assets/images/image1.jpeg'},
    {'name': 'Eka Hospital', 'alamat': 'Alamatnya 2', 'code': 'bp', 'image': 'assets/images/image2.jpeg'},
    {'name': 'Omni', 'alamat': 'Alamatnya 3', 'code': 'bp', 'image': 'assets/images/image3.jpeg'},
    {'name': 'Harkit', 'alamat': 'Alamatnya 4', 'code': 'pr', 'image': 'assets/images/image4.jpeg'},
    {'name': 'Sari asih', 'alamat': 'Alamatnya 5', 'code': 'pr', 'image': 'assets/images/image5.jpeg'},
    {'name': 'Hermina', 'alamat': 'Alamatnya 6', 'code': 'pr', 'image': 'assets/images/image6.jpeg'},
    {'name': 'Buah hati', 'alamat': 'Alamatnya 7', 'code': 'tr', 'image': 'assets/images/image7.jpeg'},
    {'name': 'Anissa', 'alamat': 'Alamatnya 8', 'code': 'tr', 'image': 'assets/images/image8.jpeg'},
    {'name': 'Gress', 'alamat': 'Alamatnya 9', 'code': 'tr', 'image': 'assets/images/image9.jpeg'},
  ].obs;

  final List<Hospital> hospitalList = [
    Hospital("semua", "Semua"),
    Hospital("bp", "BPJS"),
    Hospital(
      "pr",
      "Partner",
    ),
    Hospital("tr", "Terdekat"),
  ];

  // dummy data
  final kliniklDetail = [
    {'name': 'Klinik Fatmawati', 'alamat': 'Alamatnya 1', 'code': 'bp', 'image': 'assets/images/image1.jpeg'},
    {'name': 'Klinik Eka Hospital', 'alamat': 'Alamatnya 2', 'code': 'bp', 'image': 'assets/images/image2.jpeg'},
    {'name': 'Klinik Omni', 'alamat': 'Alamatnya 3', 'code': 'bp', 'image': 'assets/images/image3.jpeg'},
    {'name': 'Klinik Harkit', 'alamat': 'Alamatnya 4', 'code': 'pr', 'image': 'assets/images/image4.jpeg'},
    {'name': 'Klinik Sari asih', 'alamat': 'Alamatnya 5', 'code': 'pr', 'image': 'assets/images/image5.jpeg'},
    {'name': 'Klinik Hermina', 'alamat': 'Alamatnya 6', 'code': 'pr', 'image': 'assets/images/image6.jpeg'},
    {'name': 'Klinik Buah hati', 'alamat': 'Alamatnya 7', 'code': 'tr', 'image': 'assets/images/image7.jpeg'},
    {'name': 'Klinik Anissa', 'alamat': 'Alamatnya 8', 'code': 'tr', 'image': 'assets/images/image8.jpeg'},
    {'name': 'Klinik Gress', 'alamat': 'Alamatnya 9', 'code': 'tr', 'image': 'assets/images/image9.jpeg'},
  ].obs;

  final List<Hospital> kliniklList = [
    Hospital("semua", "Semua"),
    Hospital("bp", "BPJS"),
    Hospital(
      "pr",
      "Partner",
    ),
    Hospital("tr", "Terdekat"),
  ];

  final List<String> bannerLsit = [
    'assets/images/banner1.jpeg',
    'assets/images/banner2.jpeg',
    'assets/images/banner3.jpeg',
  ];

  onClickRs(String value) {
    selectedIndex(value);
    update();
  }

  onClickKlinik(String value) {
    selectedIndexKlinik(value);
    update();
  }
}
