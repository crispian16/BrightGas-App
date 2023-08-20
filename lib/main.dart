import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/firebase_options.dart';
import 'package:customer/login/page_auth.dart';
import 'package:customer/model/models_account.dart';
import 'package:customer/model/models_product.dart';
import 'package:customer/page_route.dart';
import 'package:customer/tampilanDepan/page_mainmenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
// import 'firebase_options.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(App());
}

class CounterItem with ChangeNotifier {
  final List<ModelProduct> listProduct = [];
  int _counteritem = 1;

  int get counteritem => _counteritem;
  void add(ModelProduct data) {
    listProduct.add(data);
    _counteritem++;
    notifyListeners();
  }

  void remove(ModelProduct data) {
    listProduct.remove(data);
    _counteritem--;
    notifyListeners();
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterItem>(
          create: (context) => CounterItem(),
        ),
        StreamProvider<ModelAccount>(
          create: (context) {
            FirebaseFirestore firestore = FirebaseFirestore.instance;
            final id = FirebaseAuth.instance.currentUser?.uid;
            log(id.toString());
            return firestore.doc('customer/$id').snapshots().map((event) {
              final data = event.data();
              if (data == null) {
                return ModelAccount();
              }
              print(data);

              return ModelAccount.fromJson(data);
            });
          },
          initialData: ModelAccount(),
        ),
      ],
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PageMainMenu();
          } else {
            return PageAuth();
          }
        },
      ),
      onGenerateRoute: RouteGenerate.generateRoute,
    );
  }
}
