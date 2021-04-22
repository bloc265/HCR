import 'package:flutter/material.dart';
import 'package:hcr/constants/global.dart';

class Cards extends StatelessWidget {
  const Cards({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/qr');
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.26,
                  width: MediaQuery.of(context).size.width * 0.42,
                  decoration: BoxDecoration(
                    color: textdata,
                    boxShadow: [
                      BoxShadow(
                          color: black,
                          offset: Offset(1.5, 1.8),
                          blurRadius: 20.9)
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          width: MediaQuery.of(context).size.width * 0.42,
                          alignment: Alignment.center,
                          image: AssetImage(
                            "assets/download.png",
                          ),
                        ),
                      ),
                      Text(
                        "QR CODE",
                        style: TextStyle(
                            color: textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.26,
                width: MediaQuery.of(context).size.width * 0.42,
                decoration: BoxDecoration(
                  color: textdata,
                  boxShadow: [
                    BoxShadow(
                        color: black,
                        offset: Offset(1.5, 1.8),
                        blurRadius: 20.9)
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.26,
                width: MediaQuery.of(context).size.width * 0.42,
                decoration: BoxDecoration(
                  color: textdata,
                  boxShadow: [
                    BoxShadow(
                        color: black,
                        offset: Offset(1.5, 1.8),
                        blurRadius: 20.9)
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.26,
                width: MediaQuery.of(context).size.width * 0.42,
                decoration: BoxDecoration(
                  color: textdata,
                  boxShadow: [
                    BoxShadow(
                        color: black,
                        offset: Offset(1.5, 1.8),
                        blurRadius: 20.9),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
