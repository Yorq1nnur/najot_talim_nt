import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot_talim_nt/screens/timer/start_time_screen.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import 'cubit/time_task_cubit.dart';

class TimeTaskScreen extends StatefulWidget {
  const TimeTaskScreen({super.key});

  @override
  State<TimeTaskScreen> createState() => _TimeTaskScreenState();
}

class _TimeTaskScreenState extends State<TimeTaskScreen> {
  TimeOfDay? timeOfDay;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _taskController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                AppImages.profile,
                height: 40,
                width: 40,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          'SET YOUR TIME',
                          style: AppTextStyle.interBold.copyWith(
                            color: Colors.indigoAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        IconButton(
                          onPressed: () async {
                            timeOfDay = await showTimePicker(
                              context: context,
                              initialEntryMode: TimePickerEntryMode.input,
                              initialTime: const TimeOfDay(hour: 0, minute: 0),
                              builder: (BuildContext context, Widget? child) {
                                return MediaQuery(
                                  data: MediaQuery.of(context)
                                      .copyWith(alwaysUse24HourFormat: true),
                                  child: child!,
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.timer,
                            size: 200,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Your Time";
                            }
                            return null;
                          },
                          controller: _taskController,
                          style: const TextStyle(
                            color: Colors.tealAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(16)),
                            hintText: 'TASK NAME',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Ink(
                  width: double.infinity,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate() &&
                          timeOfDay != null) {
                        if (!context.mounted) return;
                        context.read<TimeTaskCubit>().addHourMinute(
                            hour: timeOfDay!.hour,
                            minute: timeOfDay!.minute,
                            taskName: _taskController.text);
                        debugPrint(
                            "---------------------------hour: ${context.read<TimeTaskCubit>().state.hour}");
                        debugPrint(
                            "---------------------------minute: ${context.read<TimeTaskCubit>().state.minute}");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StartTaskScreen(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              "Enter the task name and time!!!",
                              style: AppTextStyle.interBold
                                  .copyWith(color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Center(
                      child: Text(
                        'START',
                        style: AppTextStyle.interBold.copyWith(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
