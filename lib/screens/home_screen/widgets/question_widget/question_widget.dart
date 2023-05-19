import 'package:auto_size_text/auto_size_text.dart';
import 'package:crossover_test/models/question.dart';
import 'package:crossover_test/screens/home_screen/widgets/flashcard_back.dart';
import 'package:crossover_test/screens/home_screen/widgets/question_interaction_column.dart';
import 'package:crossover_test/screens/home_screen/widgets/question_widget/bloc/question_widget_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  const QuestionWidget({super.key, required this.question});
  static const double horizontalPadding = 10;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.70,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.74,
                child: InkWell(
                  onTap: question.type == 'flashcard'
                      ? () {
                          context
                              .read<QuestionWidgetBloc>()
                              .add(QuestionWidgetRevealEvent(question));
                        }
                      : null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(
                        flex: 3,
                      ),
                      AutoSizeText(
                        question.question,
                        maxLines: question.type == 'mcq' ? 5 : 2,
                      ),
                      const Spacer(),
                      BlocBuilder<QuestionWidgetBloc, QuestionWidgetState>(
                        builder: (context, state) {
                          if (state is QuestionWidgetInitial &&
                              question.type == 'flashCard') {
                            return Container();
                          } else if (question.type == 'mcq') {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: question.options.map((e) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: MaterialButton(
                                      height: 50,
                                      minWidth:
                                          MediaQuery.of(context).size.width,
                                      color: state is QuestionWidgetRevealedMcq
                                          ? question.answer == e.answer
                                              ? Colors.green.withOpacity(0.4)
                                              : Colors.red.withOpacity(0.4)
                                          : Colors.white.withOpacity(0.4),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      onPressed: () {
                                        context.read<QuestionWidgetBloc>().add(
                                            QuestionWidgetRevealEvent(
                                                question));
                                      },
                                      child: Stack(
                                        children: [
                                          AutoSizeText(e.answer,
                                              maxLines: 2,
                                              minFontSize: 15,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          state is QuestionWidgetRevealedMcq
                                              ? question.answer == e.answer
                                                  ? Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Icon(
                                                        CupertinoIcons
                                                            .check_mark_circled_solid,
                                                        color: Colors.white
                                                            .withOpacity(0.4),
                                                      ),
                                                    )
                                                  : Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Icon(
                                                        CupertinoIcons
                                                            .xmark_circle_fill,
                                                        color: Colors.white
                                                            .withOpacity(0.4),
                                                      ),
                                                    )
                                              : Container()
                                        ],
                                      )),
                                );
                              }).toList(),
                            );
                          } else if (state is QuestionWidgetRevealedFlashCard) {
                            return FlashCardBack(question: question);
                          } else {
                            return Container();
                          }
                        },
                      ),
                      const Spacer(),
                      AutoSizeText(question.user.name),
                      Text(
                        question.description,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: QuestionInteraction(question: question)))
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 35,
          color: const Color.fromARGB(255, 22, 22, 22),
          child: Padding(
            padding: const EdgeInsets.only(
              left: horizontalPadding,
              right: horizontalPadding,
              top: 5,
              bottom: 5,
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(CupertinoIcons.play_rectangle_fill, size: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding),
                    child: Text(
                      'Playlist - ${question.playlist}',
                      style: Theme.of(context).primaryTextTheme.bodyMedium,
                    ),
                  ),
                  const Spacer(),
                  const Icon(CupertinoIcons.right_chevron, size: 20),
                ]),
          ),
        ),
      )
    ]);
  }
}
