import 'package:flutter/material.dart';
import 'package:flutter_blog/screens/constants.dart';
import 'package:get/get.dart';

class BottomSheetError extends StatelessWidget {
  final String errorMessage;

  const BottomSheetError({@required this.errorMessage});

  @override
  Widget build(BuildContext context) {
	return Container(
	  color: kPrimaryColor,
	  child: Padding(padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
		child: Row(
		  mainAxisSize: MainAxisSize.min,
		  children: <Widget>[
			Expanded(
			  flex: 3,
			  child: Text(errorMessage,
				textAlign: TextAlign.justify,
				style: TextStyle(color: Colors.grey[400]),
			  ),
			),
			SizedBox(width: 20),
			Expanded(
			  flex: 1,
			  child: FlatButton(
				color: Color.fromRGBO(0, 0, 0, 0.2),
				onPressed: (){Get.back();},
				child: Text("OK",
				  style: TextStyle(color: Colors.grey[400]),
				),
			  ),
			),
		  ],
		),
	  ),
	);
  }
}
