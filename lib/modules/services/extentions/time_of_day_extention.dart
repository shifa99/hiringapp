//extention =>using on existing lib to add on them
import 'package:flutter/material.dart';

extension addTime on TimeOfDay 
{
  TimeOfDay add({@required int hours, @required int minutes}) {
    return this
        .replacing(hour: this.hour + hours, minute: this.minute + minutes);
  }
}