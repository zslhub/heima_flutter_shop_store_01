import 'package:flutter/material.dart';

class HmSuggestion extends StatefulWidget {
  const HmSuggestion({super.key});

  @override
  State<HmSuggestion> createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue,
      height: 150,
      child: Text('推荐', style: TextStyle(color: Colors.white)),
    );
  }
}
