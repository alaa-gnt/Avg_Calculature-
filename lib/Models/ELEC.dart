import 'package:flutter/material.dart';

class Elect extends StatefulWidget {
  const Elect({super.key});

  @override
  State<Elect> createState() => _ElectState();
}

class _ElectState extends State<Elect> {
  final TextEditingController ciController = TextEditingController();
  final TextEditingController cfController = TextEditingController();
  final TextEditingController ccController = TextEditingController();

  double average = 0.0;

  @override
  void initState() {
    super.initState();
    ciController.addListener(updateAverage);
    cfController.addListener(updateAverage);
    ccController.addListener(updateAverage);
  }

  @override
  void dispose() {
    ciController.dispose();
    cfController.dispose();
    ccController.dispose();
    super.dispose();
  }

  void updateAverage() {
    double ci = double.tryParse(ciController.text) ?? 0.0;
    double cf = double.tryParse(cfController.text) ?? 0.0;
    double cc = double.tryParse(ccController.text) ?? 0.0;

    double moyenne = (cf * 0.5) + (ci * 0.3) + (cc * 0.2);

    setState(() {
      average = moyenne;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "ELECT (Coef: 3)",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),

          buildTextField("Enter grade for CF", cfController),
          buildTextField("Enter grade for CI", ciController),
          buildTextField("Enter grade for CC", ccController),

          const SizedBox(height: 20),
          Center(
            child: Text(
              "Moyenne du module: ${average.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
