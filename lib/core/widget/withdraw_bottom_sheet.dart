import 'package:flutter/material.dart';
import 'package:veegil/api/models/transactions/transaction_model.dart';
import 'package:veegil/api/services/api_services.dart';
import 'package:veegil/core/utilities/custom_flat_button.dart';
import 'package:veegil/core/utilities/services.dart';

// TODO: Delete this file
class WithdrawBottomSheet extends StatefulWidget {
  final String phoneNumber;
  final int balance;
  const WithdrawBottomSheet({Key? key, required this.phoneNumber, required this.balance}) : super(key: key);

  @override
  State<WithdrawBottomSheet> createState() => _WithdrawBottomSheetState();
}

class _WithdrawBottomSheetState extends State<WithdrawBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  final _amountTextController = TextEditingController();

  int? amount;
  bool isApiCall = false;

  @override
  Widget build(BuildContext context) {
    final Services services = Services();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(80), topRight: Radius.circular(80)), //
        color: Colors.grey.shade50,
      ),
      height: MediaQuery.of(context).size.height,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              services.sizedBox(h: 50),
              TextFormField(
                  controller: _amountTextController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter amount';
                    }

                    setState(() {
                      amount = int.parse(_amountTextController.text);
                    });
                    return null;
                  },
                  decoration: InputDecoration(
                    // enabledBorder: OutlineInputBorder(),
                    // contentPadding: EdgeInsets.zero,
                    hintText: 'Enter amount you want to withdraw',
                    prefixIcon: Icon(
                      Icons.money,
                      color: Theme.of(context).primaryColor,
                    ),
                    labelStyle: const TextStyle(color: Colors.black),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(
                          color: Colors.deepOrangeAccent,
                          width: 2,
                        )),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
                    ),
                    focusColor: Theme.of(context).primaryColor,
                  )),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 35),
                child: isApiCall
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                        // backgroundColor: Colors.transparent,
                      )
                    : CustomFlatButton(
                        label: 'Withdraw',
                        labelStyle: const TextStyle(fontSize: 20),
                        onPressed: () {
                          if (validateAndSave()) {
                            if (widget.balance < amount!) {
                              services.scaffold(message: 'Insufficient Funds', context: context);
                            }

                            setState(() {
                              isApiCall = true;
                            });

                            final TransactionModel model = TransactionModel(
                              phoneNumber: widget.phoneNumber,
                              transactionAmount: amount,
                            );

                            APIService.withdraw(model).then((res) {
                              setState(() {
                                isApiCall = false;
                              });
                              if (res) {
                                print('Here our transfer reponse $res');
                                services.scaffold(message: 'Withdrawal of $amount successful', context: context);
                                Navigator.pop(context);
                              } else {
                                services.scaffold(message: 'Money withdrawal failed', context: context);
                              }
                            });
                          }
                        },
                        borderRadius: 30,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
