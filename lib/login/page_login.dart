import 'package:flutter/material.dart';

class PageLogin extends StatelessWidget {
  static const routeName = '/login';

  final TextEditingController phone;
  final Function() login;
  final Function() daftar;
  final bool isLoading;

  const PageLogin({
    Key? key,
    required this.login,
    required this.daftar,
    required this.phone,
    required this.isLoading,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFEA609B),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/logo.png'),
                ),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Masuk dengan Nomor HP',
                        style: TextStyle(
                          fontFamily: 'Segoe UI:regular',
                          fontSize: 16,
                          letterSpacing: 1,
                          color: Color(0xFF000000),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            height: 55,
                            decoration: const BoxDecoration(
                              color: Color(0xFFD4D4D4),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                bottomLeft: Radius.circular(24),
                              ),
                            ),
                            child: const Text(
                              '+62',
                              style: TextStyle(
                                fontFamily: 'Segoe UI:regular',
                                fontSize: 16,
                                letterSpacing: 1,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            width: 300,
                            height: 55,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Color(0xFFDFDFDF),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(24),
                                bottomRight: Radius.circular(24),
                              ),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Nomor HP',
                                hintStyle: TextStyle(
                                  fontFamily: 'Segoe UI:regular',
                                  fontSize: 16,
                                  letterSpacing: 1,
                                  color: Color(0xFF000000),
                                ),
                              ),
                              controller: phone,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        '6 digit OTP akan dikirim ke nomor HP Anda Untuk verifikasi',
                        style: TextStyle(
                          fontFamily: 'Segoe UI:regular',
                          fontSize: 16,
                          letterSpacing: 1,
                          color: Color(0xFF000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFEA609B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          minimumSize: const Size(300, 50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 100,
                            vertical: 8,
                          ),
                          child: isLoading
                              ? const CircularProgressIndicator()
                              : const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                        ),
                        onPressed: login,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Belum punya akun?',
                            style: TextStyle(
                              fontFamily: 'Segoe UI:regular',
                              fontSize: 14,
                              letterSpacing: 1,
                              color: Color(0xFF000000),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          TextButton(
                            onPressed: daftar,
                            child: const Text(
                              'Daftar',
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
