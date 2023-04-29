import 'package:flutter/material.dart';

class TopComponent extends StatelessWidget {
  const TopComponent({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      margin: const EdgeInsets.fromLTRB(0, 10, 20, 20),
      child: Row(children: [
        Image.asset(
          "assets/Name Icon.png",
          width: size.width * 0.35,
        ),
        Expanded(
          child: SizedBox(
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              const Icon(
                Icons.notifications,
                color: Colors.black,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  child: Image.asset(
                    "assets/profile.jpg",
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ))
            ]),
          ),
        )
      ]),
    );
  }
}