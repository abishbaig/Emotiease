import 'package:flutter/material.dart';

class ReportAnalysis extends StatefulWidget {
  const ReportAnalysis({super.key});

  @override
  State<ReportAnalysis> createState() => _ReportAnalysisState();
}

class _ReportAnalysisState extends State<ReportAnalysis> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 30),
              _buildReportCards(),
              const SizedBox(height: 15),
              _buildButtons(),
              const SizedBox(height: 30),
              _buildFooterText(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      leading: Container(
        padding: const EdgeInsets.all(20.0),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Here's your",
          ),
          Text(
            "Finalized Report",
          ),
        ],
      ),
    );
  }

  Widget _buildReportCards() {
    return Column(
      children: [
        _buildReportCard(
            "Depression", "Severe", "78%", const Color(0xFFCA0B00)),
        _buildReportCard("Isolation", "Milder", "56%", const Color(0xFFFF9900)),
        _buildReportCard(
            "Restlessness", "Severe", "80%", const Color(0xFFCA0B00)),
        _buildReportCard("Confusing", "Stable", "30%", const Color(0xFF2DB731)),
      ],
    );
  }

  Widget _buildReportCard(
      String title, String severity, String percentage, Color severityColor) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                ),
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 30),
                  decoration: BoxDecoration(
                    color: severityColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    severity,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFB384FF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                percentage,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            // Add functionality here
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFB384FF),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text(
            "Download",
          ),
        ),
        OutlinedButton(
          onPressed: () {
            // add functionality here ..................
          },
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 6),
            side: const BorderSide(color: Color(0xFFB384FF)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text(
            "Retake",
          ),
        ),
      ],
    );
  }

  Widget _buildFooterText() {
    return const Center(
      child: Text(
        "Download your full report for sharing or retake the assessment to update your results.",
        textAlign: TextAlign.center,
      ),
    );
  }
}
