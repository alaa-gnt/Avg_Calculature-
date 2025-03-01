import 'package:avg_calculature/Models/ALG.dart';
import 'package:avg_calculature/Models/ALSDS.dart';
import 'package:avg_calculature/Models/ANA.dart';
import 'package:avg_calculature/Models/Archi.dart';
import 'package:avg_calculature/Models/BWB.dart';
import 'package:avg_calculature/Models/ELEC.dart';
import 'package:avg_calculature/Models/System01.dart';
import 'package:avg_calculature/Models/TEE.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: SingleChildScrollView( // ✅ Prevents overflow
            child: Column(
              children: [
                System01(),
                SizedBox(height: 20), // ✅ Added spacing between modules
                Archi(),
                SizedBox(height: 20), 
                ALG() , 
                SizedBox(height: 20), 
                ANA() , 
                SizedBox(height: 20), 
                TEE(),
                 SizedBox(height: 20),
                ALSDS() , 
                SizedBox(height: 20),
                 Bweb() , 
                 SizedBox(height: 20),
                 Elect()

              ],
            ),
          ),
        ),
      ),
    );
  }
}
