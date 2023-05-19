import 'package:crossover_test/models/question.dart';
import 'package:crossover_test/screens/home_screen/widgets/icon_column.dart';
import 'package:crossover_test/screens/home_screen/widgets/question_widget/bloc/question_widget_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionInteraction extends StatelessWidget {
  const QuestionInteraction({super.key, required this.question});
  final Question question;
  static const double padding = 10;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(padding),
          child: Container(
              //rounded border,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).iconTheme.color!, width: 1),
                  borderRadius: BorderRadius.circular(30)),
              width: Theme.of(context).iconTheme.size! + 15,
              height: Theme.of(context).iconTheme.size! + 15,
              //clip image

              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  question.user.avatar,
                  fit: BoxFit.fill,
                ),
              )),
        ),
        IconColumn(icon: Icons.favorite, count: '20', onPressed: () {}),
        IconColumn(
            icon: CupertinoIcons.chat_bubble_text_fill,
            count: '20',
            onPressed: () {}),
        IconColumn(
            icon: CupertinoIcons.arrowshape_turn_up_right_fill,
            count: '20',
            onPressed: () {}),
        IconColumn(
            icon: CupertinoIcons.bookmark_fill, count: '20', onPressed: () {}),
        IconColumn(
            icon: CupertinoIcons.arrow_2_circlepath_circle_fill,
            count: 'flip',
            onPressed: () {
              context
                  .read<QuestionWidgetBloc>()
                  .add(QuestionWidgetRevealEvent(question));
            }),
      ],
    );
  }
}
