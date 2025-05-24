import 'package:flutter/material.dart';

class DestinationLike extends StatefulWidget {
  const DestinationLike({Key? key}) : super(key: key);

  @override
  State<DestinationLike> createState() => _DestinationLikeState();
}

class _DestinationLikeState extends State<DestinationLike> {
  int _likeCounter = 0;

  void handleDoubleTap() {
    setState(() {
      _likeCounter += 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _likeCounter++;
        });
      },
      onDoubleTap: handleDoubleTap,
      child: Container(
        color: Colors.grey,
        child: Text(
          "Like count: $_likeCounter",
        ),
      ),
    );
  }
}

