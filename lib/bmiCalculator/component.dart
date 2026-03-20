import 'package:flutter/material.dart';

import 'constants.dart';

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

class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.icon, this.onPressed);

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
          width: 56,
          height: 56
      ),
      elevation: 0,
      onPressed: onPressed,
      shape: CircleBorder(),
      child: Icon(
        icon,
        size: 25,
        color: Colors.white,
      ),
      fillColor: Colors.grey,
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton(this.onTap, this.title);

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
