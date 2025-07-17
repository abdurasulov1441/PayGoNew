import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:paygo/app/router.dart';
import 'package:paygo/services/request_helper.dart';
import 'package:paygo/services/utils/toats/error.dart';
import 'package:paygo/services/utils/toats/info.dart';
import 'package:paygo/services/utils/toats/succes.dart';
import 'package:paygo/services/style/app_colors.dart';
import 'package:paygo/services/style/app_style.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({super.key});

  @override
  _BalancePageState createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  final TextEditingController _amountController = TextEditingController();
  String? selectedPaymentSystem;

  Future<void> _makePayment() async {
    final amount = double.tryParse(_amountController.text);
    if (amount == null || amount < 1000) {
      showSuccessToast(context, 'To\'lov',
          'To\'lov miqdori kamida 1000 so\'m bo\'lishi kerak!');

      return;
    }

    try {
      final response = await requestHelper.postWithAuth(
        '/services/zyber/api/payments/make-payment',
        {'amount': amount},
      );

      if (response['success'] == true) {
        final invoiceId = response['invoice_id'];
        if (invoiceId != null) {
          showSuccessToast(context, 'payment_systems',
              'payment_send');
          router.pop();
        } else {
          showErrorToast(
              context, 'payment_systems', 'error_in_payment');
        }
      } else {
        showErrorToast(context, 'payment_systems',
            '${response['message'] ?? 'error'}');
      }
    } catch (e) {
      showErrorToast(context, 'payment_systems', 'error_conection');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.backgroundColor,
            )),
        title: Text(
          'add_balance'.tr(),
          style: AppStyle.fontStyle.copyWith(
            color: AppColors.backgroundColor,
            fontSize: 20,
          ),
        ),
        backgroundColor: AppColors.grade1,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'choose_payment_system'.tr(),
                    style: AppStyle.fontStyle
                        .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPaymentSystem = 'Click';
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedPaymentSystem == 'Click'
                              ? AppColors.grade1
                              : Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/click.png',
                            width: 120,
                            height: 120,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPaymentSystem = 'Payme';
                      });
                      showInfoToast(context, 'payment_systems', 'comming_soon');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedPaymentSystem == 'Payme'
                              ? AppColors.grade1
                              : Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/payme.png',
                            width: 120,
                            height: 120,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (selectedPaymentSystem == null) ...[
                LottieBuilder.asset(
                  'assets/lottie/balance_pop_up.json',
                ),
              ] else if (selectedPaymentSystem == 'Click') ...[
                TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'enter_number_for_pay'.tr(),
                    labelText: 'summa'.tr(),
                    labelStyle:
                        AppStyle.fontStyle.copyWith(color: AppColors.grade1),
                    prefixIcon: const Icon(
                      Icons.attach_money,
                      color: AppColors.grade1,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.grade1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.grade1),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final amount = double.tryParse(_amountController.text);
                    if (amount == null || amount < 1000) {
                      showErrorToast(context, 'payment_systems',
                          'payment_min');
                    } else {
                      _makePayment();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: AppColors.grade1,
                  ),
                  child: Text(
                    'add_balance'.tr(),
                    style: AppStyle.fontStyle
                        .copyWith(color: AppColors.backgroundColor),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
