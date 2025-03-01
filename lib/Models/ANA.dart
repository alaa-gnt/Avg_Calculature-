import 'package:flutter/material.dart';

class ANA extends StatefulWidget {
  const ANA({super.key});

  @override
  State<ANA> createState() => _ANAState();
}

class _ANAState extends State<ANA> {
  TextEditingController cfController = TextEditingController();
  TextEditingController ciController = TextEditingController();
  double moyenne = 0.0;

  void calculateMoyenne() {
    double cf = double.tryParse(cfController.text) ?? 0.0;
    double ci = double.tryParse(ciController.text) ?? 0.0;
    setState(() {
      moyenne = (cf * 0.67) + (ci * 0.33);
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
              "ANA (Coef: 5)",
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
          Text("CI:"),
          TextField(
            controller: ciController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Enter grade for CI",
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
