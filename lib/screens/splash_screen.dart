import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 110,
              ),
              Text(
                'Apni Dukaan',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[800]),
              ),
              Text(
                'One place for all the products !',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.purple[400]),
              ),
              SizedBox(
                height: 110,
              ),
              LottieBuilder.asset(
                'assets/animation/lottieAnim.json',
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
