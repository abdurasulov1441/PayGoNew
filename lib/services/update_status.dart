import 'package:paygo/services/request_helper.dart';
import 'package:flutter/material.dart';

Future<void> updateOrderStatus({
  required BuildContext context,
  required int orderId,
  required int newStatusId,
  Function(int)? onSuccess,
  String successMessage = 'Статус заказа обновлен',
}) async {
  try {
    final response = await requestHelper.patchWithAuth(
      '/zyber/paygo/api/orders/update-order-status/$orderId',
      {'status_id': newStatusId},
    );

    if (response['message'] == 'Order status updated successfully') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$successMessage (Заказ #$orderId)'),
          duration: const Duration(seconds: 2),
        ),
      );
      print('Order #$orderId updated to status $newStatusId');
      if (onSuccess != null) {
        onSuccess(orderId);
      }
    } else {
      throw 'Unexpected response: ${response['message']}';
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Ошибка при обновлении статуса: $e')),
    );
  }
}
