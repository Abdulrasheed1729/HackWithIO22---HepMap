import 'package:flutter/material.dart';
import 'package:hack_with_io/modules/modules.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case '/splash':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case '/onboarding':
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case '/register-sucess':
        return MaterialPageRoute(
          builder: (_) => const SuccessfullyRegisteredScreen(),
        );
      case '/sign-in':
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
        );
      case '/sign-up':
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(),
        );
      case '/reminder':
        return MaterialPageRoute(
          builder: (_) => const ReminderView(),
        );
      case '/profile-settings':
        return MaterialPageRoute(
          builder: (_) => const ProfileSettingScreen(),
        );
      case '/medical-record':
        return MaterialPageRoute(
          builder: (_) => const MedicalRecordScreeen(),
        );
      case '/symptoms':
        return MaterialPageRoute(
          builder: (_) => const SymptomsScreen(),
        );
      case '/contact-support':
        return MaterialPageRoute(
          builder: (_) => const ContactSupportScreen(),
        );
      case '/choose-doctor':
        return MaterialPageRoute(
          builder: (_) => ChooseDoctorScreen(),
        );
      case '/doctor-profile':
        return MaterialPageRoute(
          builder: (_) => const DoctorProfileScreen(),
        );
      case '/specialist':
        return MaterialPageRoute(
          builder: (_) => const SeeSpacialistScreen(),
        );
      case '/set-reminder':
        return MaterialPageRoute(
          builder: (_) => const SetReminderScreen(),
        );
      case '/prescription':
        return MaterialPageRoute(
          builder: (_) => const DrugPrescriptionScreen(),
        );

      case '/health-tips':
        return MaterialPageRoute(
          builder: (_) => const HealthTipsScreen(),
        );
      case '/community':
        return MaterialPageRoute(
          builder: (_) => const CommunityScreen(),
        );
      case '/add-post':
        return MaterialPageRoute(
          builder: (_) => const AddPostScreen(),
        );
      case '/chat':
        return MaterialPageRoute(
          builder: (_) => const ChatScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('Error Page'),
        ),
      );
    });
  }
}
