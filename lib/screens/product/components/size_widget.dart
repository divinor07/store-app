import 'package:flutter/material.dart';
import 'package:store_app/models/item_size.dart';

class SizeWidget extends StatelessWidget {
  final ItemSize size;

  const SizeWidget({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: !size.hasStock ? Colors.red.withAlpha(50) : Colors.grey,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            color: !size.hasStock ? Colors.red.withAlpha(50) : Colors.grey,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text(
              size.name,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'R\$ ${size.price.toStringAsFixed(2)}',
              style: TextStyle(
                color: !size.hasStock ? Colors.red.withAlpha(50) : Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
