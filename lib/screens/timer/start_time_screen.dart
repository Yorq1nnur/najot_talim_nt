import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot_talim_nt/screens/timer/time_task_screen.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import '../../cubits/timer/time_state_cubit.dart';
import '../../cubits/timer/time_task_cubit.dart';

class StartTaskScreen extends StatefulWidget {
  const StartTaskScreen({super.key});

  @override
  State<StartTaskScreen> createState() => _StartTaskScreenState();
}

class _StartTaskScreenState extends State<StartTaskScreen> {
  @override
  void initState() {
    Future.microtask(() {
      context.read<TimeTaskCubit>().startTime();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeTaskCubit, TimeTaskState>(
      builder: (BuildContext context, TimeTaskState state) {
        return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: IconButton(
                  onPressed: () {
                    if (state.finishTime) {
                      context.read<TimeTaskCubit>().finishTaskTime();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TimeTaskScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'YOU CANNOT CLOSE THE SCREEN UNTIL THE TASK TIMES OUT!!!',
                            style: AppTextStyle.interBold.copyWith(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
            body: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TASK NAME:',
                    style: AppTextStyle.interBold.copyWith(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    state.taskName,
                    style: AppTextStyle.interBold.copyWith(
                      color: Colors.white.withOpacity(
                        0.5,
                      ),
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        width: 300,
                        height: 300,
                        child: CircularProgressIndicator(
                          value: state.progressValue,
                          color: Colors.red,
                          backgroundColor: Colors.blueGrey,
                          strokeWidth: 8,
                        ),
                      ),
                      Positioned(
                        right: 30,
                        bottom: 125,
                        child: RichText(
                          text: TextSpan(
                            text: state.hour.toString().length == 1
                                ? "0${state.hour.toString()}"
                                : state.hour.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                            children: [
                              TextSpan(
                                text: state.minute.toString().length == 1
                                    ? " : 0${state.minute.toString()} : "
                                    : " : ${state.minute.toString()} : ",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                ),
                              ),
                              TextSpan(
                                text: state.second.toString().length == 1
                                    ? "0${state.second.toString()}"
                                    : state.second.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (state.finishTime)
                    ScaffoldMessenger(
                      child: AlertDialog(
                        title: const Text('Finish'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              context.read<TimeTaskCubit>().finishTaskTime();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TimeTaskScreen(),
                                ),
                              );
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ));
      },
    );
  }
}
