import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_coba/src/pokemon.dart';
import 'package:flutter_coba/src/informasi.dart';
import 'package:flutter_coba/src/setting.dart';
import 'package:flutter_coba/src/variabel.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final PageController myPage = PageController(initialPage: menus);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: myPage,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            Pokemon(),
            Informasi(),
            Setting(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: heightWidget! / 13,
        child: SizedBox(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    menus = 0;
                    myPage.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        menus == 0 ? Icons.home : Icons.home_outlined,
                        color: Colors.blue[700],
                        size: 30,
                      ),
                      Text(
                        "Home",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    menus = 1;
                    myPage.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      menus == 1
                          ? Icons.pie_chart
                          : Icons.pie_chart_outline_outlined,
                      color: Colors.blue[700],
                      size: 30,
                    ),
                    Text(
                      "Chart",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    menus = 2;
                    myPage.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      menus == 2 ? Icons.settings : Icons.settings_outlined,
                      color: Colors.blue[700],
                      size: 30,
                    ),
                    Text(
                      "Pengaturan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
