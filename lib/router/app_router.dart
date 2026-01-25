import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/providers/auth_provider.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/auth/presentation/screens/profile_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/recepcion/presentation/screens/captura_vineta_screen.dart';
import '../features/recepcion/presentation/screens/confirmacion_screen.dart';
import '../features/recepcion/presentation/screens/verificacion_datos_screen.dart';
import '../features/recepcion/presentation/screens/confirmacion_cobro_screen.dart';
import '../features/caja/presentation/screens/pendientes_screen.dart';
import '../features/entrega/presentation/screens/captura_entrega_screen.dart';
import '../features/entrega/presentation/screens/confirmacion_entrega_screen.dart';

// Route names
class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String profile = '/profile';
  // Recepcion routes
  static const String recepcionCaptura = '/recepcion/captura';
  static const String recepcionVerificacion = '/recepcion/verificacion';
  static const String recepcionCobro = '/recepcion/cobro';
  static const String recepcionConfirmacion = '/recepcion/confirmacion';
  // Entrega routes
  static const String entregaCaptura = '/entrega/captura';
  static const String entregaConfirmacion = '/entrega/confirmacion';
  // Caja routes
  static const String cajaPendientes = '/caja/pendientes';
}

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = authState.isAuthenticated;
      final isLoggingIn = state.matchedLocation == AppRoutes.login;
      final isRegistering = state.matchedLocation == AppRoutes.register;
      final isSplash = state.matchedLocation == AppRoutes.splash;

      // Si está cargando, mostrar splash
      if (authState.isLoading && isSplash) {
        return null;
      }

      // Si no está autenticado y no está en login/register, ir a login
      if (!isLoggedIn && !isLoggingIn && !isRegistering) {
        return AppRoutes.login;
      }

      // Si está autenticado y está en login/register/splash, ir a home
      if (isLoggedIn && (isLoggingIn || isRegistering || isSplash)) {
        return AppRoutes.home;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.register,
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.profile,
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      // Recepcion routes
      GoRoute(
        path: AppRoutes.recepcionCaptura,
        name: 'recepcion-captura',
        builder: (context, state) => const CapturaVinetaScreen(),
      ),
      GoRoute(
        path: AppRoutes.recepcionVerificacion,
        name: 'recepcion-verificacion',
        builder: (context, state) => const VerificacionDatosScreen(),
      ),
      GoRoute(
        path: AppRoutes.recepcionCobro,
        name: 'recepcion-cobro',
        builder: (context, state) => const ConfirmacionCobroScreen(),
      ),
      GoRoute(
        path: AppRoutes.recepcionConfirmacion,
        name: 'recepcion-confirmacion',
        builder: (context, state) => const ConfirmacionScreen(),
      ),
      // Entrega routes
      GoRoute(
        path: AppRoutes.entregaCaptura,
        name: 'entrega-captura',
        builder: (context, state) => const CapturaEntregaScreen(),
      ),
      GoRoute(
        path: AppRoutes.entregaConfirmacion,
        name: 'entrega-confirmacion',
        builder: (context, state) => const ConfirmacionEntregaScreen(),
      ),
      // Caja routes
      GoRoute(
        path: AppRoutes.cajaPendientes,
        name: 'caja-pendientes',
        builder: (context, state) => const PendientesScreen(),
      ),
    ],
    errorBuilder: (context, state) => ErrorScreen(error: state.error),
  );
});

// Splash Screen que verifica el estado de autenticación
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Verificar estado de autenticación al iniciar
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authStateProvider.notifier).checkAuthStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

// Error Screen
class ErrorScreen extends StatelessWidget {
  final Exception? error;

  const ErrorScreen({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              'Página no encontrada',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.home),
              child: const Text('Ir al inicio'),
            ),
          ],
        ),
      ),
    );
  }
}
