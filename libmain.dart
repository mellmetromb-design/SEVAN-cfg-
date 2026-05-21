import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CFG Panel',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      debugShowCheckedModeBanner: false,
      home: const CFGPanel(),
    );
  }
}

class CFGPanel extends StatefulWidget {
  const CFGPanel({super.key});
  @override
  State<CFGPanel> createState() => _CFGPanelState();
}

class _CFGPanelState extends State<CFGPanel> {
  bool _isActive = true;
  void _toggle(bool on) => setState(() => _isActive = on);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Text(_isActive ? "CFG ACTIVATED" : "CFG DEACTIVATED", style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green)),
              const SizedBox(height: 8),
              Text("# CFG BY SEVAN", style: TextStyle(color: Colors.grey[500])),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(child: ElevatedButton(onPressed: () => _toggle(true), style: ElevatedButton.styleFrom(backgroundColor: Colors.green), child: const Text("[ВКЛЮЧИТЬ CFG]", style: TextStyle(color: Colors.black)))),
                  const SizedBox(width: 16),
                  Expanded(child: ElevatedButton(onPressed: () => _toggle(false), style: ElevatedButton.styleFrom(backgroundColor: Colors.red), child: const Text("[ОТКЛЮЧИТЬ CFG]"))),
                ],
              ),
              const SizedBox(height: 24),
              Text(_isActive ? "АКТИВАЦИЯ ЗАВЕРШЕНА" : "АКТИВАЦИЯ ОТМЕНЕНА", style: TextStyle(color: _isActive ? Colors.green : Colors.red)),
              const Divider(),
              const SizedBox(height: 16),
              Text("# CFG BY SEVAN ACTIVE", style: TextStyle(color: Colors.grey[500])),
            ],
          ),
        ),
      ),
    );
  }
}