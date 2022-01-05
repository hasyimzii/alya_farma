import 'package:flutter/cupertino.dart';
import '../models/category.dart';
import '../models/medic.dart';

class CategoryProvider with ChangeNotifier {
  final List<Category> _category = [
    Category(
      name: 'Alat Tes',
      image:
          'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2020/10/3/eefb843f-53fa-4345-b1bc-946f15a42072.jpg',
    ),
    Category(
      name: 'Kotak P3K',
      image:
          'https://images.tokopedia.net/img/cache/500-square/product-1/2017/5/2/5476119/5476119_73f00da1-4fa2-4165-9f38-24791ed13437_600_600.jpg',
    ),
    Category(
      name: 'Oksigen',
      image: 'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2021/7/7/f977c01a-7e65-4aad-84b4-050e22386f78.jpg',
    ),
  ];
  
  final List<Medic> _medic = [
    Medic(
      code: 'AF-01',
      name: 'DISPOSABLE ECG ELEKTRODE ONEMED⁣',
      category: 'Alat Tes',
      unit: 'pack',
      price: 80000,
      discount: 0,
      stock: 50,
      image:
          'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2020/10/3/eefb843f-53fa-4345-b1bc-946f15a42072.jpg',
      description:
          'Elektroda OneDot Dewasa OneMed / ECG Elektroda disposable (sekali pakai) adalah alat tes diagnostik umum yang digunakan untuk mengevaluasi fungsi jantung.⁣\nSpesifikasi:⁣\n- KEMENKES RI AKL 20502516609⁣\n- Ukuran dewasa diameter 50mm⁣\n- Daya rekat kuat⁣\n- Bisa untuk segala macam jenis cardiac monitor⁣\n- Lebih sensitif karena dilengkapi dengan pregelled AG/AGCL sensor⁣\n- Bebas PVC dan bebas latex⁣\n- Kemasan aluminium foil⁣\n- Isi 50 pcs / pack⁣\n\nNOTE :\n- Order sebelum jam 4 sore akan dikirim dihari itu juga.\n- Sebaliknya, order diatas jam 4 sore mengikuti pengiriman dihari berikutnya.\n- Mohon tanyakan ketersediaan barang, karena stok terbatas\n- Barang yang kita kirim sudah melalui Quality Check dan dipastikan dalam keadaan baik saat dikirim.\n- Kerusakan yang diakibatkan oleh pihak ekspedisi diluar tanggung jawab kami.',
    ),
    Medic(
      code: 'AF-02',
      name: 'Kotak P3K merk OneMed sudah lengkap dengan isinya⁣',
      category: 'Kotak P3K',
      unit: 'set',
      price: 50000,
      discount: 36500,
      stock: 30,
      image:
          'https://images.tokopedia.net/img/cache/500-square/product-1/2017/5/2/5476119/5476119_73f00da1-4fa2-4165-9f38-24791ed13437_600_600.jpg',
      description:
          'Isi:\n* 1 sachet isi 10 pcs Plester Anti Air\n* 1 roll Plester Non Woven 2,5cm x 1m\n* 1 roll Verban 5 cm\n* 1 roll Verban 10 cm\n* 1 roll Kapas 25 gr\n* 2 lbr Alkohol Swab\n* 1 pc Kasa steril 16x16cm\n* 1 bh Gunting kecil\n* 1 psg Sarung Tangan Latex\n* 1 btl Ecodine 10cc (obat luka)\n* 1 btl Rivanol 100 cc\nSedia selalu P3K untuk antisipasi kecelakaan\nSedia selalu pahlawan rawat luka, kotak p3k set + isi di mobil/ sepeda motor/ kendaraan pribadi juga dalam lingkungan kerja dan tempat tinggal Anda! Antisipasi kecelakaan saat perjalanan/ kegiatan Anda.\nSize pxlxt: 22x11x6 cm\nSatuan: set\nNOTE :\n- Order sebelum jam 4 sore akan dikirim dihari itu juga.\n- Sebaliknya, order diatas jam 4 sore mengikuti pengiriman dihari berikutnya.\n- Mohon tanyakan ketersediaan barang, karena stok terbatas\n- Barang yang kita kirim sudah melalui Quality Check dan dipastikan dalam keadaan baik saat dikirim.\n- Kerusakan yang diakibatkan oleh pihak ekspedisi diluar tanggung jawab kami.',
    ),
    Medic(
      code: 'AF-03',
      name: 'Jacson Rees Dewasa',
      category: 'Oksigen',
      unit: 'set',
      stock: 10,
      price: 54400,
      discount: 510000,
      image: 'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2021/7/7/f977c01a-7e65-4aad-84b4-050e22386f78.jpg',
      description:
          'Jacson Rees Dewasa adalah modifikasi anesthesi circuit mapleson C yang dipakai saat tindakan ventilasi oksigen dan intubasi Ett pada pasien IGD dan ICU\n\nNOTE :\n- Order sebelum jam 4 sore akan dikirim dihari itu juga.\n- Sebaliknya, order diatas jam 4 sore mengikuti pengiriman dihari berikutnya.\n- Mohon tanyakan ketersediaan barang, karena stok terbatas\n- Barang yang kita kirim sudah melalui Quality Check dan dipastikan dalam keadaan baik saat dikirim.\n- Kerusakan yang diakibatkan oleh pihak ekspedisi diluar tanggung jawab kami.',
    ),
  ];

  List<Category> get category => _category;
  int get length => _category.length;

  final List<Medic> _categoryResult = [];
  List<Medic> get categoryResult => _categoryResult;
  int get categoryLength => _categoryResult.length;

  void medicCategory(String category) {
    _categoryResult.clear();
    for (Medic data in _medic) {
      if (data.category == category) {
        _categoryResult.add(data);
      }
    }
    notifyListeners();
  }
}
