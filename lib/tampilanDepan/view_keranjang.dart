import 'package:customer/tampilanDepan/keranjang/view_saatini.dart';
import 'package:customer/tampilanDepan/keranjang/view_selesai.dart';
import 'package:flutter/material.dart';

class ViewKeranjang extends StatefulWidget {
  static const routeName = '/keranjang';

  const ViewKeranjang({Key? key}) : super(key: key);

  @override
  State<ViewKeranjang> createState() => _ViewKeranjangState();
}

class _ViewKeranjangState extends State<ViewKeranjang>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEA609B),
        elevation: 0,
        iconTheme: IconThemeData(color: const Color(0xFFFFFFFF)),
        centerTitle: true,
        title: const Text(
          'Keranjang',
          style: TextStyle(
            fontFamily: 'Segoe UI, Regular',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      body: Column(
        children: [
          TabBar(
            unselectedLabelColor: const Color(0xFFBDBDBD),
            indicatorWeight: 2,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: const Color(0xFFEA609B),
            labelColor: const Color(0xFF000000),
            controller: controller,
            tabs: const [
              Tab(
                text: 'Saat Ini',
              ),
              Tab(
                text: 'Selesai',
              ),
            ],
          ),
          const Divider(
            height: 1,
            color: Color.fromARGB(255, 161, 161, 161),
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: const [
                ViewSaatini(),
                ViewSelesai(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
