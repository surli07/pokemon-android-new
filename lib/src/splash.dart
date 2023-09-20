import 'package:flutter/material.dart';
import 'package:flutter_coba/navbar.dart';
import 'package:flutter_coba/src/pokemon.dart';
import 'package:flutter_coba/src/variabel.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    // Setelah 4 detik, beralih ke halaman NavigationBar
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => NavBar(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      heightWidget = MediaQuery.of(context).size.height;
    });
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  children: [
                    Image.network(
                      'https://www.pokemon.com/static-assets/app/static3/img/og-default-image.jpeg',
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text(
                      "Pokemon",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Helvetica",
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              loading
                  ? LoadingAnimationWidget.hexagonDots(
                      size: 35.0,
                      color: Colors.white,
                    )
                  : const SizedBox(
                      height: 0,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
