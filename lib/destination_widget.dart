

import 'package:flutter/material.dart';

class DestinationWidget extends StatefulWidget {
  const DestinationWidget({super.key, required this.destinationName}) ;

  final String destinationName;

  @override
  State<DestinationWidget> createState() => _DestinationWidgetState();
}

class _DestinationWidgetState extends State<DestinationWidget> {

  @override
  void initState() {
    super.initState();
    
    // You can add any initialization logic here if needed
  }

  @override
  void dispose() {
    // Clean up any resources if needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.destinationName);
  }
}