import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LastUpdatedStatusText extends StatelessWidget {
  const LastUpdatedStatusText({Key key, @required this.text}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class LastUpdatedDateFormatter {
  final DateTime lastUpdated;

  LastUpdatedDateFormatter({this.lastUpdated});

  String lastUpdatedStatusText() {
    if (lastUpdated != null) {
      final formatter = DateFormat.yMd().add_Hms();
      final formatted = formatter.format(lastUpdated);
      return "last updated: $formatted";
    }
    return '';
  }
}
