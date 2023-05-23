import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    'assets/images/kursi_1.png',
    'assets/images/kursi_2.png',
    'assets/images/kursi_3.png',
    'assets/images/kursi_4.png',
  ];

  List<String> categories = [
    'Living Room',
    'Bedroom',
    'Dining Room',
    'Kitchen',
  ];

  Widget listMenu() {
    return SizedBox(
      height: 33,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 70,
            height: 33,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // ignore: use_full_hex_values_for_flutter_colors
              color: const Color(0xfff9A9390),
            ),
            child: Center(
              child: Text(
                'All',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          ...categories
              .map(
                (e) => Container(
                  height: 33,
                  margin: const EdgeInsets.only(left: 14),
                  child: Center(
                    child: Text(
                      '${e}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
              .toList()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Text(
          'Home',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 1,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              SharedPreferences.getInstance().then((value) {
                value.clear();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              });
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xfff5f5f5),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: Text(
                'Discover the most modern furniture',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 14),
                child: listMenu()),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                'Recommended Furnitures',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: images.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        // Menggunakan Expanded untuk mengatur tinggi item secara fleksibel
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200,
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadiusDirectional.only(
                                  topStart: Radius.circular(20),
                                  topEnd: Radius.circular(20),
                                ),
                                child: Image.asset(
                                  images[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                width: 40,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.pink,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 30,
                              left: 0,
                              right: 0,
                              // top: 100,
                              child: Container(
                                height: 100,
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadiusDirectional.only(
                                    bottomStart: Radius.circular(20),
                                    bottomEnd: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Modern Chair',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '\$ 200',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Color.fromARGB(
                                                  255, 184, 170, 44),
                                              size: 20,
                                            ),
                                            SizedBox(width: 5),
                                            Text('4.5'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
