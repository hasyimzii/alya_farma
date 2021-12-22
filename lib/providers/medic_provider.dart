import 'package:flutter/foundation.dart';
import '../models/medic_model.dart';

class MedicProvider with ChangeNotifier {
  // movie class models
  final List<MedicModel> _medic = [
    MedicModel(
      code: 'AF-01',
      name: 'DISPOSABLE ECG ELEKTRODE ONEMED⁣',
      category: 'Alat Tes',
      unit: 'pack',
      buyPrice: 50000,
      price: 80000,
      discount: 0,
      stock: 50,
      image: 'https://cf.shopee.co.id/file/104dc5c0b121adac0ffb1aa5a2727dad',
      description:
          'Elektroda OneDot Dewasa OneMed / ECG Elektroda disposable (sekali pakai) adalah alat tes diagnostik umum yang digunakan untuk mengevaluasi fungsi jantung.⁣\nSpesifikasi:⁣\n- KEMENKES RI AKL 20502516609⁣\n- Ukuran dewasa diameter 50mm⁣\n- Daya rekat kuat⁣\n- Bisa untuk segala macam jenis cardiac monitor⁣\n- Lebih sensitif karena dilengkapi dengan pregelled AG/AGCL sensor⁣\n- Bebas PVC dan bebas latex⁣\n- Kemasan aluminium foil⁣\n- Isi 50 pcs / pack⁣\n\nNOTE :\n- Order sebelum jam 4 sore akan dikirim dihari itu juga.\n- Sebaliknya, order diatas jam 4 sore mengikuti pengiriman dihari berikutnya.\n- Mohon tanyakan ketersediaan barang, karena stok terbatas\n- Barang yang kita kirim sudah melalui Quality Check dan dipastikan dalam keadaan baik saat dikirim.\n- Kerusakan yang diakibatkan oleh pihak ekspedisi diluar tanggung jawab kami.',
    ),
    MedicModel(
      code: 'AF-02',
      name: 'Kotak P3K merk OneMed sudah lengkap dengan isinya⁣',
      category: 'Kotak P3K',
      unit: 'set',
      buyPrice: 30000,
      price: 50000,
      discount: 36500,
      stock: 30,
      image: 'https://cf.shopee.co.id/file/9516ef5c7bca4211f1ce0bb6e021d724',
      description:
          'Isi:\n* 1 sachet isi 10 pcs Plester Anti Air\n* 1 roll Plester Non Woven 2,5cm x 1m\n* 1 roll Verban 5 cm\n* 1 roll Verban 10 cm\n* 1 roll Kapas 25 gr\n* 2 lbr Alkohol Swab\n* 1 pc Kasa steril 16x16cm\n* 1 bh Gunting kecil\n* 1 psg Sarung Tangan Latex\n* 1 btl Ecodine 10cc (obat luka)\n* 1 btl Rivanol 100 cc\nSedia selalu P3K untuk antisipasi kecelakaan\nSedia selalu pahlawan rawat luka, kotak p3k set + isi di mobil/ sepeda motor/ kendaraan pribadi juga dalam lingkungan kerja dan tempat tinggal Anda! Antisipasi kecelakaan saat perjalanan/ kegiatan Anda.\nSize pxlxt: 22x11x6 cm\nSatuan: set\nNOTE :\n- Order sebelum jam 4 sore akan dikirim dihari itu juga.\n- Sebaliknya, order diatas jam 4 sore mengikuti pengiriman dihari berikutnya.\n- Mohon tanyakan ketersediaan barang, karena stok terbatas\n- Barang yang kita kirim sudah melalui Quality Check dan dipastikan dalam keadaan baik saat dikirim.\n- Kerusakan yang diakibatkan oleh pihak ekspedisi diluar tanggung jawab kami.',
    ),
  ];

  List get medic => _medic;
  int get medicLength => _medic.length;
}
