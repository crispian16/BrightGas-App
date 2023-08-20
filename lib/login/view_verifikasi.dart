import 'dart:async';
import 'package:customer/tampilanDepan/page_mainmenu.dart';
import 'package:flutter/material.dart';

class ViewVerifikasi extends StatefulWidget {
  @override
  State<ViewVerifikasi> createState() => _ViewVerifikasiState();
}

class _ViewVerifikasiState extends State<ViewVerifikasi> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 1);
    return Timer(
      duration,
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return const PageMainMenu();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xFFFFFFFF),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset('assets/icons/verifikasi.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Nomor ponsel sukses di verifikasi',
                style: TextStyle(
                  fontFamily: 'Segoe UI:regular',
                  fontSize: 14,
                  letterSpacing: 1,
                  color: Color(0xFF000000),
                ),
                textAlign: TextAlign.center,
              )
            ],
          )),
    );
  }
}
