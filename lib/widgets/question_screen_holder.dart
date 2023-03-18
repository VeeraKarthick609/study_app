import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shimmer/shimmer.dart';

class QuestionScreenHolder extends StatelessWidget {
  const QuestionScreenHolder({super.key});

  @override
  Widget build(BuildContext context) {
    var line = Container(
      width: double.infinity,
      height: 12,
      color: Theme.of(context).scaffoldBackgroundColor,
    );
    var answers = Container(
      width: double.infinity,
      height: 50,
      color: Theme.of(context).scaffoldBackgroundColor,
    );
    return Shimmer.fromColors(
        child: EasySeparatedColumn(
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 20,
              );
            },
            children: [
              EasySeparatedColumn(
                  children: [line, line, line],
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  }),
              answers,
              answers,
              answers,
              answers
            ]),
        baseColor: Colors.white,
        highlightColor: Colors.blueGrey.withOpacity(0.1));
  }
}
