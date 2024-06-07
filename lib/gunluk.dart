import 'dart:js';

import 'package:flutter/material.dart';
import 'package:gunluk_odev/anasayfa.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AdminSayfa(),
    );
  }
}

class AdminSayfa extends StatelessWidget {
  TextEditingController kullanici = TextEditingController();
  TextEditingController sifre = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş Sayfası'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Kullanıcı Adı"),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            controller: kullanici,
          ),
          SizedBox(height: 20.0),
          Text("Şifre"),
          TextField(
            controller: sifre,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              String kullanici_Ad = kullanici.text;
              String kullanici_sifre = sifre.text;
              if (kullanici_Ad == 'ferhat' && kullanici_sifre == '100') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnaSayfa()),
                );
              } else {
                print("Hatalı Şifre Veya Kullanıcı Adı");
              }
            },
            child: const Text('Giriş Yap'),
          ),
        ],
      ),
    );
  }
}
