
import 'package:flutter/material.dart';

class ListGenresWidget extends StatelessWidget {
  final List listGenres;
  const ListGenresWidget({
    required this.listGenres,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 164,
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listGenres.length,
        itemBuilder: (_, i) {
          return Row(
            children: [
              Container(
                // width: 60,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   // color: Colors.lightBlueAccent,
                  // ),
                  // color: Colors.lightBlue[100],
                  color: const Color(0xFFDBE3FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  listGenres[i],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue[400],
                  ),
                ),
              ),
              const SizedBox(width: 8)
            ],
          );
        },
      ),
    );
  }
}