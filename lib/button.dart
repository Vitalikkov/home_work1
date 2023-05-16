import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 60,
      color: Colors.grey.withOpacity(0.3),
      child: buttonSection(),
    );
  }

  Widget buttonSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
        _buildButtonColumn(Colors.green, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(Colors.black, Icons.share, 'SHARE'),
      ],
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

