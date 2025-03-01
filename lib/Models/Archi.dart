import 'package:flutter/material.dart';

class Archi extends StatefulWidget {
  const Archi({super.key});

  @override
  State<Archi> createState() => _ArchiState();
}

class _ArchiState extends State<Archi> {
  final TextEditingController ciController = TextEditingController();
  final TextEditingController cfController = TextEditingController();

  double average = 0.0;

  @override
  void initState() {
    super.initState();
    ciController.addListener(updateAverage);
    cfController.addListener(updateAverage);
  }

  @override
  void dispose() {
    ciController.dispose();
    cfController.dispose();
    super.dispose();
  }

  void updateAverage() {
    double ci = double.tryParse(ciController.text) ?? 0.0;
    double cf = double.tryParse(cfController.text) ?? 0.0;

    // 🔥 Apply the formula: 50% CI + 50% CF
    double moyenne = (ci * 0.5) + (cf * 0.5);

    setState(() {
      average = moyenne;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[300], // ✅ Background color
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "ARCHI (Coef: 4)",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),

          buildTextField("Enter grade for CI", ciController),
          buildTextField("Enter grade for CF", cfController),

          const SizedBox(height: 20),
          Center(
            child: Text(
              "Moyenne du module: ${average.toStringAsFixed(2)}",
              style: TextStyle(
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
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white, // ✅ Background color applied to all fields
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
