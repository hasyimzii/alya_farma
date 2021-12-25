import 'package:flutter/cupertino.dart';
import '../models/category.dart';

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
      image: 'https://s1.bukalapak.com/img/61886204011/large/Jacksen_Rees.png',
    ),
  ];

  List<Category> get category => _category;
  int get length => _category.length;
}
