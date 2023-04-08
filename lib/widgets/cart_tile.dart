import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/providers/cart_provider.dart';

class CartTile extends StatelessWidget {
  final CartItem cart;

  const CartTile(this.cart, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cart.id),
      background: Container(
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        context.read<CartProvider>().removeItem(cart.id);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: ListTile(
          leading: Text('\$${cart.price}'),
          title: Text(cart.title),
          subtitle: Text('Total: \$${cart.price * cart.quantity}'),
          trailing: Text('${cart.quantity}x'),
        ),
      ),
    );
  }
}
