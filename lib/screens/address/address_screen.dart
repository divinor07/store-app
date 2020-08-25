import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/common/price_card.dart';
import 'package:store_app/models/cart_manager.dart';
import 'package:store_app/screens/address/components/address_card.dart';

class AddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrega'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AddressCard(),
          Consumer<CartManager>(
            builder: (_, cartManager, __) {
              return PriceCard(
                buttonText: 'Continuar para o Pagamento',
                onPressed: cartManager.isAddressValid ? () {} : null,
              );
            },
          ),
        ],
      ),
    );
  }
}
