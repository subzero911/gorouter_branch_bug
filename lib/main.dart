import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter_branch_bug/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Go Router Branch Bug',
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('show bottomsheet'),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text('BottomSheet'),
                            const SizedBox(height: 32),
                            ElevatedButton(
                              child: const Text('show modal dialog'),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return SimpleDialog(
                                        title: const Text('dialog'),
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              // I wanted to close both this dialog and bottomsheet...
                                              Navigator.pop(context);
                                              Navigator.pop(context); // CRASH!
                                            },
                                            child: const Text('close dialog'),
                                          ),
                                        ],
                                      );
                                    });
                              },
                            ),
                            const SizedBox(height: 32),
                            ElevatedButton(
                                child: const Text('close bottomsheet'),
                                onPressed: () {
                                  context.pop();
                                }),
                          ],
                        ),
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
