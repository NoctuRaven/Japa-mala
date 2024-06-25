// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:japa_mala/layers/presentation/pages/add_new_pratice_page/add_new_pratice_page.dart';
import 'package:japa_mala/layers/presentation/pages/mantra_page/mantra_page.dart';
import 'package:japa_mala/layers/presentation/pages/meditation_page/meditation_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screemSize = (MediaQuery.of(context).size.height +
            MediaQuery.of(context).size.width) /
        2;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "App japa-mala",
        ),
        backgroundColor: Colors.red[800],
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 5,
            width: double.maxFinite,
            color: Colors.white,
          ),
          Container(
            height: 5,
            width: double.maxFinite,
            color: Colors.blue,
          ),
          Container(
            height: 5,
            width: double.maxFinite,
            color: Colors.green[800],
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.yellow[800],
              child: Stack(
                children: [
                  Positioned(
                    bottom: -30,
                    left: -20,
                    child: Image.asset(
                      "assets/images/border.png",
                      height: screemSize / 3,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    top: -30,
                    right: -20,
                    child: Transform.rotate(
                      angle: -3.14 / 1,
                      child: Image.asset(
                        "assets/images/border.png",
                        height: screemSize / 3,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -30,
                    left: -17,
                    child: Transform.rotate(
                      angle: -3.14 / -2,
                      child: Image.asset(
                        "assets/images/border.png",
                        height: screemSize / 3,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -30,
                    right: -18,
                    child: Transform.rotate(
                      angle: -3.14 / 2,
                      child: Image.asset(
                        "assets/images/border.png",
                        height: screemSize / 3,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/dharma.png",
                      height: screemSize / 3,
                      // color: Colors.purpleAccent,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HomePageMainIcon(
                            iconImage: "assets/images/meditation_image.png",
                            iconTitle: "Timer",
                            iconColor: Colors.yellow,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const MeditationPage(),
                                ),
                              );
                            },
                          ),
                          HomePageMainIcon(
                            iconImage: "assets/images/om.png",
                            iconTitle: "Japa-mala",
                            iconColor: Colors.green.shade800,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const MantraPage(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HomePageMainIcon(
                          iconImage: "assets/images/add.png",
                          iconTitle: "Add new pratice",
                          iconColor: Colors.red.shade800,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const AddNewPraticePage(),
                              ),
                            );
                          },
                        ),
                        HomePageMainIcon(
                          iconImage: "assets/images/favorite.png",
                          iconTitle: "About this app",
                          iconColor: Colors.blue.shade900,
                          onTap: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 5,
            width: double.maxFinite,
            color: Colors.white,
          ),
          Container(
            height: 5,
            width: double.maxFinite,
            color: Colors.blue,
          ),
          Container(
            height: 5,
            width: double.maxFinite,
            color: Colors.green[800],
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: Colors.red[900],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    "ཨོཾ་མུ་ནི་མུ་ནི་མཧཱ་མུ་ནི་ཡེ་སྭཱཧཱ།།",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HomePageMainIcon extends StatelessWidget {
  final String iconImage;
  final String iconTitle;
  final Color iconColor;
  final void Function() onTap;

  const HomePageMainIcon(
      {Key? key,
      required this.iconImage,
      required this.iconTitle,
      required this.onTap,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(5.0),
              width: 80,
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  // color: Colors.white,
                ),
                shape: BoxShape.circle,
                color: Colors.yellow,
              ),
              child: Container(
                width: 75,
                height: 75,
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  iconImage,
                  fit: BoxFit.contain,
                  // color: Colors.white,
                ),
              ),
            ),
          ),
          Text(
            iconTitle,
            style: GoogleFonts.kalam(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              // color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
