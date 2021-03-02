import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class inputuser extends StatelessWidget {
  const inputuser({
    Key key,
    @required this.etinputuser,
  }) : super(key: key);

  final TextEditingController etinputuser;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: etinputuser,
      decoration: InputDecoration(hintText: 'Masukkan Suhu Dalam Celcious'),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
      ],
    );
  }
}
