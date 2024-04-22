import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot_talim_nt/data/repositories/file_repository.dart';
import 'package:najot_talim_nt/file_manager_screen.dart';
import 'package:najot_talim_nt/services/file_maneger_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FileManagerService();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => FileRepository(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        home: const FileManagerScreen(),
      ),
    );
  }
}
