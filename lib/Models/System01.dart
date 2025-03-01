import 'package:flutter/material.dart';

class System01 extends StatefulWidget {
  const System01({super.key});

  @override
  State<System01> createState() => _System01State();
}

class _System01State extends State<System01> {
  final TextEditingController ciController = TextEditingController();
  final TextEditingController cfController = TextEditingController();
  final TextEditingController tdController = TextEditingController();
  final TextEditingController introController = TextEditingController();

  double average = 0.0;

  @override
  void initState() {
    super.initState();
    ciController.addListener(updateAverage);
    cfController.addListener(updateAverage);
    tdController.addListener(updateAverage);
    introController.addListener(updateAverage);
  }

  @override
  void dispose() {
    ciController.dispose();
    cfController.dispose();
    tdController.dispose();
    introController.dispose();
    super.dispose();
  }

  void updateAverage() {
    double ci = double.tryParse(ciController.text) ?? 0.0;
    double cf = double.tryParse(cfController.text) ?? 0.0;
    double td = double.tryParse(tdController.text) ?? 0.0;
    double intro = double.tryParse(introController.text) ?? 0.0;

    // Convert INT from /8 to /20
    double convertedIntro = (intro / 8) * 20;

    // 🔥 Apply the new formula
    double moyenne = (cf * 0.5) + (ci * 0.3) + (convertedIntro * 0.1) + (td * 0.1);

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
              "SYS (Coef: 3)",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),

          buildTextField("Enter grade for CF", cfController),
          buildTextField("Enter grade for CI", ciController),
          buildTextField("Enter grade for Intro (/8)", introController),
          buildTextField("Enter grade for TD (same as CC)", tdController),

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
