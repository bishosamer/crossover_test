import 'package:auto_size_text/auto_size_text.dart';
import 'package:crossover_test/models/question.dart';
import 'package:crossover_test/screens/home_screen/widgets/knowledge_button.dart';
import 'package:flutter/material.dart';

class FlashCardBack extends StatefulWidget {
  final Question question;
  const FlashCardBack({super.key, required this.question});

  @override
  State<FlashCardBack> createState() => _FlashCardBackState();
}

class _FlashCardBackState extends State<FlashCardBack> {
  int selectedButton = 0;
  @override
  Widget build(BuildContext context) {
    //answer to the question and 5 buttons indicating how well the user knows the answer
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Answer",
          style: TextStyle(
              color: Colors.teal, fontWeight: FontWeight.bold, fontSize: 15),
        ),
        AutoSizeText(
          widget.question.answer!,
          maxLines: 12,
        ),
        const Text(
          'How well do you know this?',
          style: TextStyle(fontSize: 15, color: Colors.white70),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KnowledgeButton(
                isSelected: selectedButton == 0 ? null : selectedButton == 1,
                color: const Color(0xfff17d23),
                onPressed: () {
                  setState(() {
                    selectedButton = 1;
                  });
                },
                text: '1',
              ),
              KnowledgeButton(
                isSelected: selectedButton == 0 ? null : selectedButton == 2,
                color: const Color(0xfffbb668),
                onPressed: () {
                  setState(() {
                    selectedButton = 2;
                  });
                },
                text: '2',
              ),
              KnowledgeButton(
                isSelected: selectedButton == 0 ? null : selectedButton == 3,
                color: const Color(0xffffd449),
                onPressed: () {
                  setState(() {
                    selectedButton = 3;
                  });
                },
                text: '3',
              ),
              KnowledgeButton(
                isSelected: selectedButton == 0 ? null : selectedButton == 4,
                color: const Color(0xff16624f),
                onPressed: () {
                  setState(() {
                    selectedButton = 4;
                  });
                },
                text: '4',
              ),
              KnowledgeButton(
                isSelected: selectedButton == 0 ? null : selectedButton == 5,
                color: const Color(0xff1f8a70),
                onPressed: () {
                  setState(() {
                    selectedButton = 5;
                  });
                },
                text: '5',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
