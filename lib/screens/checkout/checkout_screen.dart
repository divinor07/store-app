import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/common/price_card.dart';
import 'package:store_app/models/cart_manager.dart';
import 'package:store_app/models/checkout_manager.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<CartManager, CheckoutManager>(
      create: (_) => CheckoutManager(),
      update: (_, cartManager, checkoutManager) =>
          checkoutManager..updateCart(cartManager),
      lazy: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pagamento'),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            PriceCard(
              buttonText: 'Finalizar Pedido',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
