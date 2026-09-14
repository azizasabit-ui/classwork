double processOrder({
  required String orderId,
  required double itemPrice,
  String? promoCode,
  double? deliveryFee,
}) {
  // Default delivery fee if it is null
  final double finalDeliveryFee = deliveryFee ?? 500.0;

  // Calculate discount
  double discount = 0.0;

  if (promoCode == 'SAVE10') {
    discount = itemPrice * 0.10;
  }

  // Calculate final total
  final double finalTotal =
      itemPrice - discount + finalDeliveryFee;

  // Print order summary
  print('--- Order Summary ---');
  print('Order ID: $orderId');
  print('Item price: ${itemPrice.toStringAsFixed(2)} ₸');
  print('Promo code: ${promoCode ?? "None"}');
  print('Discount: ${discount.toStringAsFixed(2)} ₸');
  print(
    'Delivery fee: ${finalDeliveryFee.toStringAsFixed(2)} ₸',
  );
  print('Final total: ${finalTotal.toStringAsFixed(2)} ₸');
  print('---------------------');

  return finalTotal;
}

void main() {
  final double total1 = processOrder(
    orderId: 'ORD-001',
    itemPrice: 10000.0,
    promoCode: 'SAVE10',
  );

  print('Returned total: ${total1.toStringAsFixed(2)} ₸');

  print('');

  final double total2 = processOrder(
    orderId: 'ORD-002',
    itemPrice: 5000.0,
    deliveryFee: 800.0,
  );

  print('Returned total: ${total2.toStringAsFixed(2)} ₸');
}