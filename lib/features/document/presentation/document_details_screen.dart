import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:writeapp/utils/theme/theme.dart';

class DocumentDetailsScreen extends StatelessWidget {
  const DocumentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      "assets/images/back.png",
                      scale: 3,
                    ),
                  ),
                  Image.asset(
                    "assets/images/logo.png",
                    color: secondaryColor,
                  ),
                  const Text(
                    "Share",
                    style: TextStyle(
                        color: primaryColorDK,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Song for the Old Ones",
                      style: TextStyle(
                          color: primaryColorDK,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0),
                    ),
                    Text(
                      "by Smart Developer",
                      style: TextStyle(
                          color: secondaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "My Fathers sit on benches \n their flesh counts every plank the slats leave dents of darkness deep in their withered flanks. \n They nod like broken candles all waxed and burnt profound they say 'It's understanding that makes the world go round. \n There in those pleated faces I see the auction block the chains and slavery's coffles the whip and lash and stock. \n My Fathers speak in voices that shred my fact and sound they say 'It's our submission that makes the world go round.'\n They used the finest cunning their naked wits and wiles the lowly Uncle Tomming and Aunt Jemima's smiles. \n They've laughed to shield their crying then shuffled through their dreams and stepped 'n' fetched a country to write the blues with screams. \n I understand their meaning it could and did derive from living on the edge of death They kept my race alive.",
                      style: TextStyle(
                        color: primaryColorDK,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        letterSpacing: sqrt1_2,
                      ),
                      textAlign: TextAlign.start,
                      maxLines: null,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
