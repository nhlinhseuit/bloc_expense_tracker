import 'package:flutter/material.dart';

class MainScreenRecordNote extends StatefulWidget {
  const MainScreenRecordNote({super.key});

  @override
  State<MainScreenRecordNote> createState() => _MainScreenRecordNoteState();
}

class _MainScreenRecordNoteState extends State<MainScreenRecordNote> {
  @override
  Widget build(BuildContext context) {
    bool isRecording = false;
    String timerText = "00:00";

    void toggleRecording() {
      setState(() {
        isRecording = !isRecording;
        timerText = isRecording ? "Recording..." : "00:00";
      });
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black, // Nền đen
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Vòng tròn hiển thị thời gian
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueGrey[900], // Màu nền vòng tròn
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.mic,
                      color: Colors.pinkAccent,
                      size: 30,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      timerText,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Press Start",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Nút Start
              ElevatedButton.icon(
                onPressed: toggleRecording,
                icon: const Icon(Icons.mic),
                label: Text(isRecording ? "STOP" : "START"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
              const SizedBox(height: 20),

              // Nút Play Recording
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.play_arrow),
                label: const Text("Play Recording"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
