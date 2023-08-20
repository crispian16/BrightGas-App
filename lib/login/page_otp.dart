import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PageOtp extends StatelessWidget {
  static const routeName = '/otp';

  final TextEditingController kodeOtp;
  final Function() otp;
  final bool isLoading;

  PageOtp({
    Key? key,
    required this.kodeOtp,
    required this.otp,
    required this.isLoading,
  }) : super(key: key);

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFF707070)),
      borderRadius: BorderRadius.circular(30),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xFFFFFFFF),
          body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                const SizedBox(height: 101),
                const Text(
                  'Kode OTP telah terkirim',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Segoe UI,Regular',
                    color: Color(0xFF000000),
                  ),
                ),

                const SizedBox(height: 101),
                const Text(
                  'Masukan Kode',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Segoe UI,Regular',
                    color: Color(0xFF000000),
                  ),
                ),

                //OTP
                const SizedBox(
                  height: 75,
                ),
                Pinput(
                  controller: kodeOtp,
                  // ignore: avoid_print
                  defaultPinTheme: defaultPinTheme,
                  onCompleted: (pin) => print(pin),
                  length: 6,
                ),

                const SizedBox(height: 48),
                const Text(
                  'Anda akan menerima sms kode OTP pada nomor yang telah dimasukkan',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Segoe UI,Regular',
                    color: Color(0xFF000000),
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 48),
                const Text(
                  '0',
                  style: TextStyle(
                    fontSize: 48,
                    fontFamily: 'Segoe UI,Regular',
                    color: Color(0xFF000000),
                  ),
                ),

                const SizedBox(height: 48),
                Container(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ButtonTheme(
                    minWidth: 300,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEA609B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: otp,
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : const Text(
                              'Verifikasi',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
