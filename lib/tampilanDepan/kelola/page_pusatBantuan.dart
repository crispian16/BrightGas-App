import 'package:flutter/material.dart';

class PagePusatBantuan extends StatelessWidget {
  static const routeName = '/pusatbantuan';

  const PagePusatBantuan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFFFFF),
          elevation: 1,
          centerTitle: true,
          title: const Text(
            'Pusat Bantuan',
            style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 20,
              fontFamily: 'Segoe UI,semibold',
            ),
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_sharp,
              color: Color(0xFF000000),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Silahkan Anda Bertanya',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Segoe UI,semibold',
                          color: Color(0xFF000000),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Kami selalu siap membantu',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Segoe UI,semibold',
                          color: Color(0xFF000000),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Klik link email berikut:',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Segoe UI,semibold',
                          color: Color(0xFF000000),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Image.asset('assets/icons/mail.png'),
                          const SizedBox(width: 7),
                          const Text(
                            'info@brightgasaja.com',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Segoe UI,regular',
                              color: Color(0xFF000000),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Image.asset('assets/images/callCenter.png'),
                    ],
                  )),
              Container(
                color: const Color(0xFFEA609B),
                height: 450,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            width: 124,
                            height: 31,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/facebook.png',
                              ),
                              const SizedBox(width: 15),
                              Image.asset(
                                'assets/icons/instagram.png',
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xFFFFFFFF),
                      height: 1,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 26, left: 14, right: 14, bottom: 26),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Perusahaan',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Segoe UI,semibold',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: Text(
                                  'Join',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Segoe UI,semibold',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Tentang Kami',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Segoe UI,light',
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: Text(
                                  'Reseller',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Segoe UI,light',
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Layanan',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Segoe UI,light',
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: Text(
                                  'Pelanggan',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Segoe UI,light',
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Bantuan',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Segoe UI,light',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: Text(
                                  'Kontak',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Segoe UI,light',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Pusat Bantuan',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Segoe UI,light',
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: Text(
                                  'info@brightgasaja.com  \n021-9000-9000 \nJl. A. P. Pettarani No. 18 G, Tamamaung, Kec. Panakkukang, Kota Makassar, Sulawesi Selatan 90222',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Segoe UI,light',
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(
                          top: 20, left: 20, right: 20, bottom: 20),
                      color: const Color.fromARGB(255, 238, 65, 140),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Copyright © 2022 PT.Massindo Gas Energi',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Segoe UI,light',
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'All rights reserved.',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Segoe UI,light',
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: const [
                              Text(
                                'Ketentuan Layanan',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Segoe UI,light',
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                              Text(
                                ' | ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Segoe UI,light',
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                              Text(
                                'Kebijakan Privasi',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Segoe UI,light',
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
