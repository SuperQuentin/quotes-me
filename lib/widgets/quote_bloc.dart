import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:startup_namer/services/quote_api.dart';
import 'package:startup_namer/models/quote.dart';
import '../models/quote.dart';

class QuoteBlocWidget extends StatelessWidget with GetItMixin {
  QuoteBlocWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Text('test')],
    );
  }
}
