
import 'package:flutter/material.dart';

class KeyValueWidget extends StatelessWidget {

  String keyName='';
  String keyValue='';
  KeyValueWidget( this.keyName,  this.keyValue);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              keyName,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              flex: 2,
              child: Text(
                ' : $keyValue',
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFF7E7E7E),
                ),
              )),
        ],
      ),
    );
  }
}
