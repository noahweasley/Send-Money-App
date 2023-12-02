import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veegil/core/constants/dimensions.dart';
import 'package:veegil/core/widget/app_icon.dart';
import 'package:veegil/features/get_started/controllers/dashboard_controller.dart';
import 'package:veegil/features/get_started/screen/main_screen.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: services.appBar(
      //   title: 'Veegil Bank App',
      //   logout: Icons.logout_outlined,
      //   context: context,
      // ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    color: Colors.deepOrange,
                    height: 220,
                    width: MediaQuery.of(context).size.width / .5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: Dimensions.space1),
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                'Balance:',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: Dimensions.space1),
                              Text(
                                controller.balance,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: Dimensions.space1),

                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    controller.phoneNumber,
                                    style: const TextStyle(
                                      // fontFamily: "Anton",
                                      letterSpacing: 3,
                                      fontSize: 18,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const AppLogo(),
                            ],
                          ),
                        ),
                        // _services.sizedBox(h: 10),
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Text(
                            controller.name,
                            style: const TextStyle(
                              fontFamily: 'Anton',
                              letterSpacing: 3,
                              fontSize: 22,
                              color: Colors.black87,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: Dimensions.space6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.send,
                        size: 60,
                        color: Colors.green,
                      ),
                      Text(
                        'Transfer',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: Dimensions.space1),
                InkWell(
                  onTap: () {},
                  child: const Column(
                    children: [
                      Icon(
                        Icons.wallet,
                        size: 60,
                        color: Colors.redAccent,
                      ),
                      Text(
                        'Withdraw',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: Dimensions.space1),
            const Divider(thickness: 1),
            ListTile(
              leading: const Icon(
                Icons.receipt_long,
                size: 30,
              ),
              title: const Text('My Transactions', style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
                  return const MainScreen(
                    index: 1,
                  );
                }));
              },
            ),
            const Divider(thickness: 1),
          ],
        ),
      ),
    );
  }
}
