import 'package:carousel_slider/carousel_slider.dart';
import 'package:crossover_test/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:crossover_test/screens/home_screen/widgets/home_page_app_bar.dart';
import 'package:crossover_test/screens/home_screen/widgets/question_widget/bloc/question_widget_bloc.dart';
import 'package:crossover_test/screens/home_screen/widgets/question_widget/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  CarouselController controller = CarouselController();
  late TabController tabController = TabController(length: 2, vsync: this);
  @override
  void initState() {
    super.initState();
    final state = context.read<HomeScreenBloc>().state;
    tabController.addListener(() {
      if (tabController.index == 0) {
        context
            .read<HomeScreenBloc>()
            .add(HomeScreenFollowingEvent(state.questions));
      } else {
        context
            .read<HomeScreenBloc>()
            .add(HomeScreenForYouEvent(state.questions));
      }
    });
    if (state is HomeScreenInitial) {
      BlocProvider.of<HomeScreenBloc>(context).add(HomeScreenInitialEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        return Stack(
          children: [
            state is FollowingState || state is ForYouState
                ? SizedBox(
                    height: MediaQuery.of(context).size.height - 30,
                    child: CarouselSlider.builder(
                        itemCount: state.questions.length,
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          return BlocProvider(
                            create: (context) => QuestionWidgetBloc(),
                            child: QuestionWidget(
                              question: state.questions[index],
                            ),
                          );
                        },
                        carouselController: controller,
                        options: CarouselOptions(
                            animateToClosest: true,
                            scrollDirection: Axis.vertical,
                            onPageChanged: (index, reason) {
                              if (index == state.questions.length - 1) {
                                BlocProvider.of<HomeScreenBloc>(context)
                                    .add(ScrollEvent(state.questions));
                              }
                            },
                            viewportFraction: 1)),
                  )
                : const Center(child: CircularProgressIndicator()),
            Align(
              alignment: Alignment.topCenter,
              child: HomePageAppBar(tabController: tabController),
            ),
          ],
        );
      },
    );
  }
}
