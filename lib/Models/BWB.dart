import 'package:flutter/material.dart';

class Bweb extends StatefulWidget {
  const Bweb({super.key});

  @override
  State<Bweb> createState() => _BwebState();
}

class _BwebState extends State<Bweb> {
  final TextEditingController cfController = TextEditingController();
  final TextEditingController ciController = TextEditingController();
  final TextEditingController ccController = TextEditingController();

  double average = 0.0;

  @override
  void initState() {
    super.initState();
    cfController.addListener(updateAverage);
    ciController.addListener(updateAverage);
    ccController.addListener(updateAverage);
  }

  @override
  void dispose() {
    cfController.dispose();
    ciController.dispose();
    ccController.dispose();
    super.dispose();
  }

  void updateAverage() {
    double cf = double.tryParse(cfController.text) ?? 0.0;
    double ci = double.tryParse(ciController.text) ?? 0.0;
    double cc = double.tryParse(ccController.text) ?? 0.0;

    double moyenne = (cf * 0.4) + (ci * 0.4) + (cc * 0.2);

    setState(() {
      average = moyenne;
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildModuleContainer("BWEB", 1, [
      buildTextField("Enter grade for CF", cfController),
      buildTextField("Enter grade for CI", ciController),
      buildTextField("Enter grade for CC", ccController),
    ]);
  }
}

Widget buildModuleContainer(String title, int coef, List<Widget> fields) {
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
            "$title (Coef: $coef)",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 16),
        ...fields,
        const SizedBox(height: 20),
        Center(
          child: Text(
            "Moyenne du module: 0.00",
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
          fillColor: Colors.white,
        ),
      ),
      const SizedBox(height: 16),
    ],
  );
}
