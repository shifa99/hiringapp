import 'package:flutter/material.dart';

Row buildFilteredClassifiedWidget(
    {@required String label,
    @required bool checked,
    @required Function onChanged}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label),
      Checkbox(
          value: checked,
          onChanged: (value) {
            onChanged(value);
          }),
    ],
  );
}