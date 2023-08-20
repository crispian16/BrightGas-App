// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class PageDaftar extends StatelessWidget {
  static const routeName = '/daftar';

  final Function() login;

  const PageDaftar({Key? key, required this.login}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(height: 175),
        Container(
          alignment: Alignment.center,
          child: const Text(
            'Masukan Data Diri Anda',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Segoe UI,Regular',
              color: Color(0xFF000000),
            ),
          ),
        ),

        // ignore: prefer_const_constructors
        SizedBox(
          height: 30,
        ),
        Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.center,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFDFDFDF),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Nama Lengkap',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Segoe UI,Regular',
                  color: Color(0xFF000000),
                ),
              ),
            )),

        const SizedBox(
          height: 20,
        ),
        Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.center,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFDFDFDF),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Nomor HP',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Segoe UI,Regular',
                  color: Color(0xFF000000),
                ),
              ),
            )),

        const SizedBox(
          height: 20,
        ),
        Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.center,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFDFDFDF),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Pilih Kota',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Segoe UI,Regular',
                  color: Color(0xFF000000),
                ),
              ),
            )),

        const Spacer(),
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
              onPressed: () async {
                await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: const Text('Data Anda Telah Terdaftar'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ));
                login();
              },
              child: const Text(
                'Daftar',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sudah punya akun?',
              style: TextStyle(
                fontFamily: 'Segoe UI:regular',
                fontSize: 14,
                letterSpacing: 1,
                color: Color(0xFF000000),
              ),
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: login,
              child: const Text(
                'Masuk',
                style: TextStyle(
                  fontFamily: 'Segoe UI:regular',
                  fontSize: 14,
                  letterSpacing: 1,
                  color: Color.fromARGB(255, 0, 193, 252),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
