import 'package:coronavirus_rest_api_flutter_course/app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EndpointCardData {
  final String title;
  final String assetName;
  final Color color;

  EndpointCardData(
      {@required this.title, @required this.assetName, @required this.color});
}

class EndpointCard extends StatelessWidget {
  const EndpointCard({Key key, this.endpoint, this.value}) : super(key: key);

  final Endpoint endpoint;
  final int value;

  static Map<Endpoint, EndpointCardData> _cardData = {
    Endpoint.cases: EndpointCardData(
        title: 'Cases:',
        assetName: 'assets/count.png',
        color: Color(0xFFFFF492)),
    Endpoint.casesSuspected: EndpointCardData(
        title: 'Suspected:',
        assetName: 'assets/suspect.png',
        color: Color(0xFF11EEEE)),
    Endpoint.casesConfirmed: EndpointCardData(
        title: 'Confirmed:',
        assetName: 'assets/fever.png',
        color: Color(0xFFE99600)),
    Endpoint.deaths: EndpointCardData(
        title: 'Deaths:',
        assetName: 'assets/death.png',
        color: Color(0xFFE40000)),
    Endpoint.recovered: EndpointCardData(
        title: 'Recovered:',
        assetName: 'assets/patient.png',
        color: Color(0xFF70A901)),
  };

  String get formattedValue {
    if (value == null) {
      return '';
    }
    return NumberFormat('#,###,###,###').format(value);
  }

  @override
  Widget build(BuildContext context) {
    final cardData = _cardData[endpoint];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardData.title,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        color: cardData.color, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 2),
                  Image.asset(
                    cardData.assetName,
                    color: cardData.color,
                  ),
                ],
              ),
              Text(
                formattedValue,
                style: Theme.of(context).textTheme.headline5.copyWith(
                    color: cardData.color, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
