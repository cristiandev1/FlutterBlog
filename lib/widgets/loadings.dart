import 'package:flutter/material.dart';

class OverlayLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
	Animation<Color> valueColor = AlwaysStoppedAnimation<Color>(Colors.black);

	return Container(
	  width: 100,
	  height: 100,
	  color: Color.fromRGBO(0, 0, 0, 0.4),
	  child: Center(
		child: CircularProgressIndicator(
		  backgroundColor: Colors.blue,
		  valueColor: valueColor,
		),
	  ),
	);
  }
}
