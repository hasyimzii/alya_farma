import 'package:flutter/material.dart';
import '../common/style.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: greyColor.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: AspectRatio(
                    aspectRatio: 1.0 / 1.0,
                    child: Image.network(
                      'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2020/10/3/eefb843f-53fa-4345-b1bc-946f15a42072.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  'Product',
                  style: titleText(15),
                ),
                subtitle: Text(
                  'Rp 123',
                  style: priceText(13),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Icon(
                      Icons.delete_outline,
                      color: greyColor,
                      size: 23,
                    ),
                    onTap: () {},
                  ),
                  Container(
                    width: 80,
                    height: 20,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: greyColor,
                        width: 0.7,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          child: Icon(
                            Icons.remove,
                            color: greyColor,
                            size: 12,
                          ),
                          onTap: () {},
                        ),
                        Text(
                          '10',
                          style: searchText(10),
                        ),
                        InkWell(
                          child: Icon(
                            Icons.add,
                            color: greenColor,
                            size: 12,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
