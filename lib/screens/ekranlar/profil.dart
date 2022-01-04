import 'dart:ui';

import 'package:flutter/material.dart';

class ProfilEkrani extends StatefulWidget {
  const ProfilEkrani({Key? key}) : super(key: key);

  @override
  _ProfilEkraniState createState() => _ProfilEkraniState();
}

class _ProfilEkraniState extends State<ProfilEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  appBar: AppBar(
        backgroundColor: const Color(0XFFFF48066e),
        title: const Text(
          'Hesabım',
          style: TextStyle(fontSize: 22),
        ),
      ), */
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            color: Color(0XFFFF48066e),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Hesabım',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Card(
                    child: Image.network(
                  'https://productimages.hepsiburada.net/s/4/375/9631997460530.jpg',
                  fit: BoxFit.fill,
                )),
              ),
              const Text(
                'Osman Kömesöğütlü',
                style: const TextStyle(fontSize: 23),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Divider(
              height: 3,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Hesap Detayları', style: TextStyle(fontSize: 20)),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Divider(
              height: 3,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Kartlarım', style: TextStyle(fontSize: 20)),
          ),
         const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Divider(
              height: 3,
            ),
          ),
         const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Adreslerim', style: TextStyle(fontSize: 20)),
          ),
        const  Divider(
            height: 3,
          ),
        const  Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Siparişlerim', style: TextStyle(fontSize: 20)),
          ),
        const  Divider(
            height: 3,
          ),
          InkWell(
            onTap: () {
              print('Çıkış yapıldı');
            },
            child: const Padding(
              padding:  EdgeInsets.all(20.0),
              child:  Text('Çıkış Yap', style: TextStyle(fontSize: 20)),
            ),
          ),
         const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Divider(
              height: 2,
            ),
          ),
        ],
      ),
    );
  }
}
