import 'package:avg_calculature/Models/ALG.dart';
import 'package:flutter/material.dart';

class GeneralAverageCalculator extends StatefulWidget {
  @override
  _GeneralAverageCalculatorState createState() => _GeneralAverageCalculatorState();
}

class _GeneralAverageCalculatorState extends State<GeneralAverageCalculator> {
  // Map to store averages of all models
  Map<String, double> modelAverages = {
    'ALG': 0.0,
    'ALSDS': 0.0,
    'ANA': 0.0,
    'Archi': 0.0,
    'BWB': 0.0,
    'ELEC': 0.0,
    'System01': 0.0,
    'TEE': 0.0,
  };

  // Map to store coefficients of all models
  Map<String, int> modelCoefficients = {
    'ALG': 3,
    'ALSDS': 2,
    'ANA': 2,
    'Archi': 2,
    'BWB': 2,
    'ELEC': 2,
    'System01': 2,
    'TEE': 2,
  };

  // Function to update the average and coefficient of a specific model
  void updateModelAverage(String modelName, double average, int coefficient) {
    setState(() {
      modelAverages[modelName] = average;
      modelCoefficients[modelName] = coefficient;
    });
  }

  // Function to calculate the general average
  double calculateGeneralAverage() {
    double weightedSum = 0.0;
    int totalCoefficients = 0;

    modelAverages.forEach((modelName, average) {
      weightedSum += average * modelCoefficients[modelName]!;
      totalCoefficients += modelCoefficients[modelName]!;
    });

    return weightedSum / totalCoefficients;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("General Average Calculator"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Pass the callback function to each model widget
            ALG(onAverageUpdated: (average, coefficient) => updateModelAverage('ALG', average, coefficient)),
            // Add other model widgets here (e.g., ALSDS, ANA, etc.)
            SizedBox(height: 20),

            // Container to display the general average
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue[50], // Light blue background
              ),
              child: Center(
                child: Text(
                  "General Average: ${calculateGeneralAverage().toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800], // Dark blue text
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}