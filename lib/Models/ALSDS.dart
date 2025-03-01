import 'package:flutter/material.dart';

class ALSDS extends StatefulWidget {
  const ALSDS({super.key});

  @override
  State<ALSDS> createState() => _ALSDSState();
}

class _ALSDSState extends State<ALSDS> {
  final TextEditingController ciController = TextEditingController();
  final TextEditingController cfController = TextEditingController();
  final TextEditingController tp1Controller = TextEditingController();
  final TextEditingController tp2Controller = TextEditingController();
  final TextEditingController trController = TextEditingController();

  double average = 0.0;

  @override
  void initState() {
    super.initState();
    ciController.addListener(updateAverage);
    cfController.addListener(updateAverage);
    tp1Controller.addListener(updateAverage);
    tp2Controller.addListener(updateAverage);
    trController.addListener(updateAverage);
  }

  @override
  void dispose() {
    ciController.dispose();
    cfController.dispose();
    tp1Controller.dispose();
    tp2Controller.dispose();
    trController.dispose();
    super.dispose();
  }

  void updateAverage() {
    double ci = double.tryParse(ciController.text) ?? 0.0;
    double cf = double.tryParse(cfController.text) ?? 0.0;
    double tp1 = double.tryParse(tp1Controller.text) ?? 0.0;
    double tp2 = double.tryParse(tp2Controller.text) ?? 0.0;
    double tr = double.tryParse(trController.text) ?? 0.0;

    // 🔥 Apply the ALSDS formula
    double moyenne = (cf * 0.3) + (ci * 0.2) + ((tp1 + tp2) / 2 * 0.4) + (tr * 0.1);

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
              "ALSDS (Coef: 5)",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),

          buildTextField("Enter grade for CF", cfController),
          buildTextField("Enter grade for CI", ciController),
          buildTextField("Enter grade for TP1", tp1Controller),
          buildTextField("Enter grade for TP2", tp2Controller),
          buildTextField("Enter grade for TR", trController),

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
