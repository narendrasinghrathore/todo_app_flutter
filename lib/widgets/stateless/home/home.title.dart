import 'package:flutter/widgets.dart';

class HomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/evie-shaffer-1522833-unsplash-flower.jpg'),
          fit: BoxFit.contain

        )
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[Text('Welcome Naren')],
          ),
        ],
      ),
    );
  }
}
