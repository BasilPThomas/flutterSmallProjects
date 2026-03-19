import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {

  ReusableCard( {required this.colour,  required this.cardChild, required this.onPress,} );
  final Color colour;
  final Widget cardChild;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
        margin: EdgeInsets.all(15),
      ),
    );
  }
}

class IconContent extends StatelessWidget {

  IconContent(this.icon, this.label);
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              size: 80,
            )
        ),
        SizedBox(height: 10,),
        Text(
            label,
            style: TextStyle(
              fontSize: 20,
            )
        )
      ],
    );
  }
}