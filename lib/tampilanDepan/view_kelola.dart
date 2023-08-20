import 'package:customer/tampilanDepan/kelola/page_kelolaAkun.dart';
import 'package:customer/tampilanDepan/kelola/page_pusatBantuan.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewKelola extends StatelessWidget {
  static const routeName = '/kelola';

  const ViewKelola({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'Kelola',
          style: TextStyle(
            fontFamily: 'Segoe UI, Regular',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF000000),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'AKUN',
                style: TextStyle(
                  fontFamily: 'Segoe UI, Semibold',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000),
                ),
              ),
              ListTile(
                minLeadingWidth: 0,
                leading: const Icon(Icons.perm_identity),
                contentPadding: const EdgeInsets.all(0),
                title: const Text('Kelola Akun'),
                iconColor: const Color(0xFF000000),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const PageKelolaAkun()),
                  );
                },
              ),
              const Divider(
                height: 1,
                color: Color.fromARGB(255, 161, 161, 161),
              ),
              ListTile(
                minLeadingWidth: 0,
                leading: const Icon(Icons.star_border),
                contentPadding: const EdgeInsets.all(0),
                title: const Text('Beri Rating'),
                iconColor: const Color(0xFF000000),
                onTap: () {},
              ),
              const Divider(
                height: 1,
                color: Color.fromARGB(255, 161, 161, 161),
              ),
              ListTile(
                minLeadingWidth: 0,
                leading: const Icon(Icons.reply_outlined),
                contentPadding: const EdgeInsets.all(0),
                title: const Text('Bagikan Aplikasi'),
                iconColor: const Color(0xFF000000),
                onTap: () {},
              ),
              const Divider(
                height: 1,
                color: Color.fromARGB(255, 161, 161, 161),
              ),
              const SizedBox(height: 20),
              const Text(
                'KONTEN & AKTIVITAS',
                style: TextStyle(
                  fontFamily: 'Segoe UI, Semibold',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000),
                ),
              ),
              ListTile(
                minLeadingWidth: 0,
                leading: const Icon(Icons.nightlight_outlined),
                contentPadding: const EdgeInsets.all(0),
                title: const Text('Pengaturan Tema'),
                iconColor: const Color(0xFF000000),
                onTap: () {},
              ),
              const Divider(
                height: 1,
                color: Color.fromARGB(255, 161, 161, 161),
              ),
              const SizedBox(height: 20),
              const Text(
                'DUKUNGAN',
                style: TextStyle(
                  fontFamily: 'Segoe UI, Semibold',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000),
                ),
              ),
              ListTile(
                minLeadingWidth: 0,
                leading: const Icon(Icons.help_outline),
                contentPadding: const EdgeInsets.all(0),
                title: const Text('Pusat Bantuan'),
                iconColor: const Color(0xFF000000),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    PagePusatBantuan.routeName,
                  );
                },
              ),
              const Divider(
                height: 1,
                color: Color.fromARGB(255, 161, 161, 161),
              ),
              const SizedBox(height: 20),
              const Text(
                'TENTANG KAMI',
                style: TextStyle(
                  fontFamily: 'Segoe UI, Semibold',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000),
                ),
              ),
              ListTile(
                minLeadingWidth: 0,
                leading: const Icon(Icons.library_books_outlined),
                contentPadding: const EdgeInsets.all(0),
                title: const Text('Syarat dan Ketentuan'),
                iconColor: const Color(0xFF000000),
                onTap: () {},
              ),
              const Divider(
                height: 1,
                color: Color.fromARGB(255, 161, 161, 161),
              ),
              ListTile(
                minLeadingWidth: 0,
                leading: const Icon(Icons.description_outlined),
                contentPadding: const EdgeInsets.all(0),
                title: const Text('Kebijakan Privasi'),
                iconColor: const Color(0xFF000000),
                onTap: () {},
              ),
              const Divider(
                height: 1,
                color: Color.fromARGB(255, 161, 161, 161),
              ),
              ListTile(
                minLeadingWidth: 0,
                leading: const Icon(Icons.description_outlined),
                contentPadding: const EdgeInsets.all(0),
                title: const Text('Tentang Kami'),
                iconColor: const Color(0xFF000000),
                onTap: () {},
              ),
              const Divider(
                height: 1,
                color: Color.fromARGB(255, 161, 161, 161),
              ),
              ListTile(
                minLeadingWidth: 0,
                leading: const Icon(Icons.logout),
                contentPadding: const EdgeInsets.all(0),
                title: const Text(
                  'Keluar',
                  style: TextStyle(
                    fontFamily: 'Segoe UI, Semibold',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFEA609B),
                  ),
                ),
                iconColor: const Color(0xFFEA609B),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
              const Divider(
                height: 1,
                color: Color.fromARGB(255, 161, 161, 161),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
