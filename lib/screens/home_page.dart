import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Stack(children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 237,
              decoration: const BoxDecoration(
                  color: Color(0XFFFF48066e),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(38),
                    bottomRight: Radius.circular(38),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.,
                children: [
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white),
                    child: TextField(
                      cursorColor: const Color(0XFFFF48066e),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search_outlined,
                          color: Colors.grey,
                        ),
                        hintText: 'Ürün ara',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14)),
                    child: IconButton(
                      icon: Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.amber.shade600,
                      ),
                      onPressed: () {},
                      iconSize: 45,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 180,
          left: 30,
          child: Container(
            height: 145,
            width: 350,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19)),
              child: const Text(
                'veriler',
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Positioned(
            top: 350,
           // width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Column(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14)),
                      child: IconButton(
                        icon: Icon(
                          Icons.person,
                          color: Colors.amber.shade600,
                        ),
                        onPressed: () {},
                        iconSize: 45,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Erkek'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14)),
                      child: IconButton(
                        icon: Icon(
                          Icons.person,
                          color: Colors.amber.shade600,
                        ),
                        onPressed: () {},
                        iconSize: 45,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Erkek'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14)),
                      child: IconButton(
                        icon: Icon(
                          Icons.person,
                          color: Colors.amber.shade600,
                        ),
                        onPressed: () {},
                        iconSize: 45,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Erkek'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14)),
                      child: IconButton(
                        icon: Icon(
                          Icons.person,
                          color: Colors.amber.shade600,
                        ),
                        onPressed: () {},
                        iconSize: 45,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Erkek'),
                  ],
                ),
              ],
            )),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.amber,),label: 'Anasayfa' ),
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.amber,),label: 'Anasayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.amber,),label: 'Anasayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.amber,),label: 'Anasayfa'),
        ],
      ),
    );
  }
}
