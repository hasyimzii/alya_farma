import 'package:flutter/material.dart';
import '../common/style.dart';
import '../common/rupiah.dart';

import 'price.dart';

class CartContent extends StatelessWidget {
  final bool checkValue;
  final ValueChanged onCheck;
  final String image;
  final String name;
  final int price;
  final int discount;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onSub;
  final VoidCallback onDelete;

  const CartContent({
    Key? key,
    required this.checkValue,
    required this.onCheck,
    required this.image,
    required this.name,
    required this.price,
    required this.discount,
    required this.quantity,
    required this.onAdd,
    required this.onSub,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          _content(),
          _action(),
        ],
      ),
    );
  }

  Widget _content() {
    return Row(
      children: [
        Checkbox(
          value: checkValue,
          onChanged: onCheck,
        ),
        ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: AspectRatio(
              aspectRatio: 1.0 / 1.0,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            name,
            style: titleText(15),
          ),
          subtitle: _priceRow(),
        ),
      ],
    );
  }

  Widget _action() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          child: Icon(
            Icons.delete_outline,
            color: greyColor,
            size: 23,
          ),
          onTap: onDelete,
        ),
        _counter(),
      ],
    );
  }

  Widget _counter() {
    return Container(
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
            onTap: onSub,
          ),
          Text(
            '$quantity',
            style: searchText(10),
          ),
          InkWell(
            child: Icon(
              Icons.add,
              color: greenColor,
              size: 12,
            ),
            onTap: onAdd,
          ),
        ],
      ),
    );
  }

  Widget _priceRow() {
    if (discount == 0) {
      return Text(
        Rupiah.convert(price),
        style: priceText(13),
      );
    } else {
      return Price(
        price: price,
        discount: discount,
        priceStyle: priceText(13),
        subpriceStyle: subpriceText(10),
      );
    }
  }
}
