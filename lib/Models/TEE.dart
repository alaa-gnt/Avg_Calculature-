import 'package:flutter/material.dart';

class TEE extends StatefulWidget {
  const TEE({super.key});

  @override
  State<TEE> createState() => _TEEState();
}

class _TEEState extends State<TEE> {
  TextEditingController cfController = TextEditingController();
  TextEditingController pController = TextEditingController();
  double moyenne = 0.0;

  void calculateMoyenne() {
    double cf = double.tryParse(cfController.text) ?? 0.0;
    double p = double.tryParse(pController.text) ?? 0.0;
    setState(() {
      moyenne = (cf * 0.5) + (p * 0.5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "TEE (Coef: 2)",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          Text("CF:"),
          TextField(
            controller: cfController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Enter grade for CF",
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            onChanged: (value) => calculateMoyenne(),
          ),
          SizedBox(height: 16),
          Text("P:"),
          TextField(
            controller: pController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Enter grade for P",
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            onChanged: (value) => calculateMoyenne(),
          ),
          SizedBox(height: 16),
          Center(
            child: Text(
              "Moyenne du module: ${moyenne.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
