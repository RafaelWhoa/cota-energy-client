import 'package:cota_energy_flutter/commons/core/constant/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeOptions extends StatefulWidget {
  const HomeOptions({super.key});

  @override
  State<HomeOptions> createState() => _HomeOptionsState();
}

class _HomeOptionsState extends State<HomeOptions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _getOptionsCard(AppIcons.iconMap, "Map")
          ],
        )
      ],
    );
  }
}

Widget _getOptionsCard(String? svg, String title) {
  return Flexible(
      flex: 3,
      fit: FlexFit.tight,
      child: Container(
        height: 125.0,
        padding: const EdgeInsets.only(top: 15),
        decoration: const BoxDecoration(color: Colors.grey),
        child: Column(
          children: [
            SvgPicture.asset(
              svg!,
              height: 50.0,
              width: 50.0,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 40),
            )
          ],
        ),
      ));
}
