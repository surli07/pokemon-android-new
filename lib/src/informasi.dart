import 'package:flutter/material.dart';
import 'package:flutter_coba/src/variabel.dart';

class Informasi extends StatefulWidget {
  const Informasi({Key? key}) : super(key: key);

  @override
  State<Informasi> createState() => _InformasiState();
}

class _InformasiState extends State<Informasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                child: Container(
                  height: heightWidget! / 18,
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Chart",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Slab Serif",
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 15,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 0.5,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 1.3,
                                  width: 350,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
