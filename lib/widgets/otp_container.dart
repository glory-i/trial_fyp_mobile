/* import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../size_config.dart';

class OTPContainer extends StatefulWidget {
  final TextEditingController textEditingController;
  const OTPContainer({super.key, required this.textEditingController});

  @override
  State<OTPContainer> createState() => _OTPContainerState();
}

class _OTPContainerState extends State<OTPContainer> {
  @override
  Widget build(BuildContext context) {
    Color color = const Color(0XFFC5C5C5);
    return Container(
      width: getProportionateScreenWidth(45),
      height: getProportionateScreenHeight(39),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(9),
      ),
      child: TextFormField(
        controller: widget.textEditingController,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
            //border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
            ),
        onChanged: (value) {
          if (color == const Color(0XFFC5C5C5)) {
                  if (!mounted) return;
if(!mounted) return; setState(() {
              color = const Color(0xFF31990D);
            });
          }
          else {
                  if (!mounted) return;
if(!mounted) return; setState(() {
              color = const Color(0XFFC5C5C5);
            });
          }
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
 */