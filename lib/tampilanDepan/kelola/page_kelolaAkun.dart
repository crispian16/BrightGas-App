import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class PageKelolaAkun extends StatefulWidget {
  const PageKelolaAkun({
    Key? key,
  }) : super(key: key);

  @override
  State<PageKelolaAkun> createState() => _PageKelolaAkun();
}

class _PageKelolaAkun extends State<PageKelolaAkun> {
  File? image;
  bool isLoading = false;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick Image: $e');
      // TODO
    }
  }

  Future uploadFile() async {
    final id = FirebaseAuth.instance.currentUser?.uid;
    final path = 'customer/$id';

    if (isLoading) return;
    setState(() {
      isLoading = true;
    });
    final im = image;
    if (im == null) return;
    final ext = im.path.split('/').last.split('.').last;
    final name = '${DateTime.now().millisecondsSinceEpoch}.$ext';
    final ref = FirebaseStorage.instance.ref().child(path).child(name);
    final uploadTask = await ref.putFile(im);
    final url = await uploadTask.ref.getDownloadURL();
    print(url);
    setState(() {
      isLoading = false;
    });

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        alignment: Alignment.center,
        content: const Text(
          'Data Anda Telah Tersimpan',
          style: TextStyle(
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference akun = firestore.collection('customer');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'Kelola Akun',
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
        child: FutureBuilder<QuerySnapshot>(
          future: akun.get(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: snapshot.data!.docs.map((e) {
                  final data = e.data() as Map;
                  if (data.isEmpty) {
                    return ItemCard(
                      image: image,
                      imageUrl: '',
                      nama: 'name',
                      noHP: 'phoneNumber',
                      kota: 'city',
                      alamat: 'address',
                      buildBottomNavigationMenu: _buildBottomNavigationMenu(),
                      uploadFile: () {},
                      isLoading: isLoading,
                    );
                  } else {
                    return ItemCard(
                      image: image,
                      imageUrl: data['imageUrl'],
                      nama: data['name'],
                      noHP: data['phoneNumber'],
                      kota: data['city'],
                      alamat: data['address'],
                      buildBottomNavigationMenu: _buildBottomNavigationMenu(),
                      uploadFile: uploadFile,
                      isLoading: isLoading,
                    );
                  }
                }).toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Column _buildBottomNavigationMenu() {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10),
        Container(
          height: 7,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.pink, borderRadius: BorderRadius.circular(10)),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 28),
          child: Text(
            'Pilih Dari',
            style: TextStyle(
              fontFamily: 'Segoe UI:regular',
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ListTile(
          title: const Text("Galeri"),
          leading: const Icon(Icons.photo_size_select_actual_rounded),
          onTap: () => pickImage(ImageSource.gallery),
        ),
        ListTile(
          title: const Text("Kamera"),
          leading: const Icon(Icons.camera_alt),
          onTap: () => pickImage(ImageSource.camera),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFFEA609B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              minimumSize: const Size(300, 50),
            ),
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Batal',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ItemCard extends StatelessWidget {
  final File? image;
  final String? imageUrl;
  final String? nama;
  final String? noHP;
  final String? kota;
  final String? alamat;
  final Widget buildBottomNavigationMenu;
  final Function() uploadFile;
  final bool isLoading;

  const ItemCard({
    Key? key,
    required this.image,
    required this.imageUrl,
    required this.buildBottomNavigationMenu,
    required this.nama,
    required this.noHP,
    required this.kota,
    required this.alamat,
    required this.uploadFile,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 95,
                height: 95,
                decoration: const BoxDecoration(
                  color: Color(0xFFEA609B),
                  shape: BoxShape.circle,
                ),
                child: (image != null)
                    ? CircleAvatar(
                        backgroundImage: FileImage(image!),
                        backgroundColor: Colors.transparent,
                      )
                    : CircleAvatar(
                        backgroundImage: NetworkImage(imageUrl!),
                        backgroundColor: Colors.white,
                      ),
              ),
            ),
            Positioned(
              right: 130,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFEA609B),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  constraints: const BoxConstraints(minWidth: 0),
                  padding: const EdgeInsets.all(2),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          color: const Color(0xFF737373),
                          height: 300,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).canvasColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: buildBottomNavigationMenu,
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.photo_camera,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nama Lengkap',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Segoe UI,Regular',
                  color: Color(0xFF000000),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.center,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color(0xFFDFDFDF),
                    width: 1,
                  ),
                  color: const Color(0xFFFFFFFF),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: nama,
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Segoe UI,Regular',
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Nomor HP',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Segoe UI,Regular',
                  color: Color(0xFF000000),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.center,
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFDFDFDF),
                    width: 1,
                  ),
                  color: const Color(0xFFFFFFFF),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: noHP,
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Segoe UI,Regular',
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Kota',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Segoe UI,Regular',
                  color: Color(0xFF000000),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.center,
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFDFDFDF),
                    width: 1,
                  ),
                  color: const Color(0xFFFFFFFF),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: kota,
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Segoe UI,Regular',
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Alamat Pengantaran',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Segoe UI,Regular',
                  color: Color(0xFF000000),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.center,
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFDFDFDF),
                    width: 1,
                  ),
                  color: const Color(0xFFFFFFFF),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: alamat,
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Segoe UI,Regular',
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Foto KTP/SIM',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Segoe UI,Regular',
                  color: Color(0xFF000000),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.center,
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFDFDFDF),
                    width: 1,
                  ),
                  color: const Color(0xFFFFFFFF),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Nomor HP',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Segoe UI,Regular',
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFEA609B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  minimumSize: const Size(300, 50),
                ),
                onPressed: uploadFile,
                child: isLoading
                    ? CircularProgressIndicator()
                    : const Text('Simpan'),
                // child: const Text(
                //   'Simpan',
                //   style: TextStyle(
                //     fontSize: 16,
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
