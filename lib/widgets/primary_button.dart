import 'package:flutter/material.dart';

import '../size_config.dart';
import '../utility/constants.dart';

class FPrimaryButton extends StatelessWidget {
  final String text;
  const FPrimaryButton({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(18),
          horizontal: getProportionateScreenWidth(8)),
      decoration: BoxDecoration(
        color: const Color(kPrimaryColor),
        borderRadius: BorderRadius.circular(
          40,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class FLogoutButton extends StatelessWidget {
  final String text;
  const FLogoutButton({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(18),
          horizontal: getProportionateScreenWidth(8)),
      decoration: BoxDecoration(
        color: const Color(kErrorColor),
        borderRadius: BorderRadius.circular(
          40,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}
