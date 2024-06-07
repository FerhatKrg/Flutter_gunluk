import 'package:flutter/material.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final TextEditingController gunluk_kullanici = TextEditingController();
  List<String> gunluk_kayit = [];

  String tarih1 = "";
  void tarih() {
    DateTime zaman = DateTime.now();
    tarih1 = "${zaman.year}-${zaman.month}-${zaman.day}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Günlük Sayfası'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: gunluk_kullanici,
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              setState(() {
                gunluk_kayit.add(gunluk_kullanici.text);
                tarih();
              });
            },
            child: Text('Günlüğe Kaydet'),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              itemCount: gunluk_kayit.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(gunluk_kayit[index]),
                  subtitle: Text(tarih1),
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          gunluk_kayit.removeAt(index);
                        });
                      },
                      icon: const Icon(Icons.delete_forever)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
