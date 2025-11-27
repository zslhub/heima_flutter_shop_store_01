import 'package:flutter/material.dart';

class HmSlider extends StatefulWidget {
  const HmSlider({super.key});

  @override
  State<HmSlider> createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 200,
      color: Colors.blue,
      child: Text('轮播图', style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}
