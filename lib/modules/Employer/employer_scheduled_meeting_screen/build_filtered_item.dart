import 'package:flutter/material.dart';
import 'package:hiring_app/components/colors.dart';

Card buildFilteredItem({@required Function onTap,@required String label}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    color: defaultColor,
    child: Container(
      padding: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
         onTap();
        },
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}
