import 'package:customer/login/page_daftar.dart';
import 'package:customer/login/page_login.dart';
import 'package:customer/login/page_otp.dart';
import 'package:customer/login/view_verifikasi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PageAuth extends StatefulWidget {
  static const routeName = '/auth';

  @override
  State<PageAuth> createState() => _PageAuthState();
}

class _PageAuthState extends State<PageAuth> {
  TextEditingController phone = TextEditingController();
  TextEditingController kodeOtp = TextEditingController();
  int tampilan = 0;
  bool isLoading = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  String _verificationId = '';

  @override
  Widget build(BuildContext context) {
    final List<Widget> _container = [
      PageLogin(
        login: login,
        daftar: () => setState(() => tampilan = 1),
        phone: phone,
        isLoading: isLoading,
      ),
      PageDaftar(
        login: () => setState(() => tampilan = 0),
      ),
      PageOtp(
        kodeOtp: kodeOtp,
        otp: otp,
        isLoading: isLoading,
      ),
      ViewVerifikasi(),
    ];
    return Container(
      child: _container[tampilan],
    );
  }

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        setState(() {
          isLoading = false;
        });
        return;
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
        print(e);
        setState(() {
          isLoading = false;
        });
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          tampilan = 2;
          _verificationId = verificationId;
          isLoading = false;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        if (mounted) {
          setState(() {
            tampilan = 0;
            _verificationId = verificationId;
            isLoading = false;
          });
        }
      },
      timeout: const Duration(seconds: 60),
    );
  }

  Future<void> otp() async {
    try {
      setState(() {
        isLoading = true;
      });
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: kodeOtp.text);

      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);
      return;
    } on Exception catch (e) {
      print(e);
    } finally {
      setState(
        () {
          tampilan = 0;
          isLoading = false;
        },
      );
    }
  }
}
