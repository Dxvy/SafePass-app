import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:go_router/go_router.dart';

import 'firebase_options.dart';

// ---------------------------------------------------------------------------
// Demo mode — set to true to run without a real Firebase project.
// In Demo Mode, no Firebase writes occur; all state lives in Riverpod only.
// ---------------------------------------------------------------------------
const bool kDemoMode = true;

// ---------------------------------------------------------------------------
// Bootstrap
// ---------------------------------------------------------------------------
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive (offline cache)
  await Hive.initFlutter();

  // Firebase — skipped in Demo Mode or if credentials are still placeholders
  if (!kDemoMode) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  runApp(
    const ProviderScope(
      child: SafePassApp(),
    ),
  );
}

// ---------------------------------------------------------------------------
// Router
// ---------------------------------------------------------------------------
final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
  ],
);

// ---------------------------------------------------------------------------
// App
// ---------------------------------------------------------------------------
class SafePassApp extends StatelessWidget {
  const SafePassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SafePass',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Inter',
      ),
      routerConfig: _router,
    );
  }
}

// ---------------------------------------------------------------------------
// Placeholder home screen
// ---------------------------------------------------------------------------
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock_outline, size: 72, color: Color(0xFF6C63FF)),
            const SizedBox(height: 16),
            Text(
              'SafePass',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (kDemoMode)
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.amber, width: 1),
                ),
                child: const Text(
                  'DEMO MODE',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
