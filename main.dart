import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rock Paper Scissors',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false, // keeps the classic look like your screenshot
      ),
      home: const RpsUiPage(),
    );
  }
}

class RpsUiPage extends StatefulWidget {
  const RpsUiPage({super.key});

  @override
  State<RpsUiPage> createState() => _RpsUiPageState();
}

class _RpsUiPageState extends State<RpsUiPage> {
  // --- These are placeholders for UI preview ---
  int youScore = 1;
  int computerScore = 3;
  String yourChoice = "Rock";
  String computerChoice = "Scissors";
  String resultText = "You Win!";

  void _onPick(String pick) {
    // Hook your game logic here (setState with new scores/choices/result)
    setState(() {
      yourChoice = pick;
      // computerChoice = ...
      // resultText = ...
      // scores...
    });
  }

  void _onReset() {
    setState(() {
      youScore = 0;
      computerScore = 0;
      yourChoice = "-";
      computerChoice = "-";
      resultText = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rock Paper Scissors"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

                // Score block
                const Text(
                  "Score",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Text("You: $youScore"),
                Text("Computer: $computerScore"),

                const SizedBox(height: 60),

                // Choices block
                Text("Your Choice: $yourChoice"),
                Text("Computer Choice: $computerChoice"),

                const SizedBox(height: 60),

                // Result block
                Text(
                  resultText.isEmpty ? " " : resultText,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 70),

                // 3 buttons row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _ChoiceButton(
                      label: "Rock",
                      onTap: () => _onPick("Rock"),
                    ),
                    const SizedBox(width: 16),
                    _ChoiceButton(
                      label: "Paper",
                      onTap: () => _onPick("Paper"),
                    ),
                    const SizedBox(width: 16),
                    _ChoiceButton(
                      label: "Scissors",
                      onTap: () => _onPick("Scissors"),
                    ),
                  ],
                ),

                const SizedBox(height: 60),

                // Reset button
                SizedBox(
                  width: 160,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: _onReset,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text("Reset Game"),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ChoiceButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _ChoiceButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 34,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Text(label, style: const TextStyle(fontSize: 12)),
      ),
    );
  }
}