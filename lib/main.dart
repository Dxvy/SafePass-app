import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'supabase_options.dart';

// ---------------------------------------------------------------------------
// Demo Mode — no hardware, no Supabase, all state lives in-memory Riverpod.
// ---------------------------------------------------------------------------
const bool kDemoMode = true;

SupabaseClient get supabase => Supabase.instance.client;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!kDemoMode) {
    await Supabase.initialize(
      url: SupabaseOptions.supabaseUrl,
      anonKey: SupabaseOptions.anonKey,
    );
  }

  runApp(const ProviderScope(child: SafePassApp()));
}

class SafePassApp extends StatelessWidget {
  const SafePassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SafePass',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      routerConfig: appRouter,
      builder: (context, child) {
        if (kDemoMode) {
          return Banner(
            message: 'DEMO',
            location: BannerLocation.topEnd,
            color: Colors.amber,
            child: child!,
          );
        }
        return child!;
      },
    );
  }
}
