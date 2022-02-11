import 'package:flutter/material.dart';

import 'ekranlar/favoriler.dart';
import 'ekranlar/home_page1.dart';
import 'ekranlar/profil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screens =[
    const HomePage1(),
    const Favoriler(),
    const ProfilEkrani(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.amber.shade400,
        unselectedFontSize: 15,
        selectedFontSize: 17,
        
        selectedItemColor:const Color(0XFFFF48066e) ,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Anasayfa'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_outlined,
              ),
              label: 'Favoriler'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_outlined,
              ),
              label: 'Profil'),
        ],
      ),
    );
  }

  Row categories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(14)),
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.person,
                    color: Colors.amber.shade600,
                  ),
                  onPressed: () {},
                  iconSize: 45,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text('Erkek'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(14)),
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.amber.shade600,
                ),
                onPressed: () {},
                iconSize: 45,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text('Kadın'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(14)),
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.amber.shade600,
                ),
                onPressed: () {},
                iconSize: 45,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text('Çocuk'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14)),
                child: IconButton(
                  icon: Icon(
                    Icons.dark_mode_outlined,
                    color: Colors.amber.shade600,
                  ),
                  onPressed: () {},
                  iconSize: 45,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text('İndirim'),
          ],
        ),
      ],
    );
  }
}
