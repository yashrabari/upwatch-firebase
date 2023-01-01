import 'package:get/get.dart';
import 'package:upwatch/screen/common_screen/common_binding.dart';
import 'package:upwatch/screen/delete_confirm_screen/delete_confirm_binding.dart';
import 'package:upwatch/screen/forgot_password_screen/forgot_password_binding.dart';
import 'package:upwatch/screen/forgot_password_screen/forgot_password_screen.dart';
import 'package:upwatch/screen/home_screen/notifications_screen/notifications_binding.dart';
import 'package:upwatch/screen/home_screen/notifications_screen/notifications_screen.dart';
import 'package:upwatch/screen/language_change_screen/language_change_binding.dart';
import 'package:upwatch/screen/login_screen/login_binding.dart';
import 'package:upwatch/screen/medical_screen/medical_binding.dart';
import 'package:upwatch/screen/my_profile/edit_profile_screen/change_password_screen/change_password_screen.dart';
import 'package:upwatch/screen/my_profile/medical_history_screen/medical_history_screen.dart';
import 'package:upwatch/screen/my_profile/profile_screen/profile_screen.dart';
import 'package:upwatch/screen/new_password_screen/new_password_binding.dart';
import 'package:upwatch/screen/selection_screen/selection_binding.dart';
import 'package:upwatch/screen/signup_screen/signup_binding.dart';
import 'package:upwatch/screen/signup_screen/signup_screen.dart';
import 'package:upwatch/screen/splash_screen/splash_binding.dart';
import 'package:upwatch/screen/splash_screen/splash_screen.dart';
import 'package:upwatch/screen/tabbar_screen/tabbar_binding.dart';
import 'package:upwatch/screen/tabbar_screen/tabbar_screen.dart';
import 'package:upwatch/screen/tutorial_screen/tutorial_binding.dart';
import 'package:upwatch/screen/tutorial_screen/tutorial_screen.dart';
import 'package:upwatch/screen/verify_email_screen/verify_email_binding.dart';
import 'package:upwatch/screen/welcome_screen/welcome_binding.dart';

import '../screen/common_screen/common_screen.dart';
import '../screen/contact_us_screen/contact_us_binding.dart';
import '../screen/contact_us_screen/contact_us_screen.dart';
import '../screen/daily_report_screen/daily_report_binding.dart';
import '../screen/daily_report_screen/daily_report_screen.dart';
import '../screen/delete_account_screen/delete_account_binding.dart';
import '../screen/delete_account_screen/delete_account_screen.dart';
import '../screen/delete_confirm_screen/delete_confirm_screen.dart';
import '../screen/help_screen/help_binding.dart';
import '../screen/help_screen/help_screen.dart';
import '../screen/language_change_screen/language_change_screen.dart';
import '../screen/login_screen/login_screen.dart';
import '../screen/measurement_selection_screen/measurement_selection_binding.dart';
import '../screen/measurement_selection_screen/measurement_selection_screen.dart';
import '../screen/medical_screen/medical_screen.dart';
import '../screen/my_profile/edit_profile_screen/change_password_screen/change_password_binding.dart';
import '../screen/my_profile/edit_profile_screen/edit_profile_binding.dart';
import '../screen/my_profile/edit_profile_screen/edit_profile_screen.dart';
import '../screen/my_profile/medical_history_screen/medical_history_binding.dart';
import '../screen/my_profile/profile_screen/profile_binding.dart';
import '../screen/new_password_screen/new_password_screen.dart';
import '../screen/selection_screen/selection_screen.dart';
import '../screen/verify_email_screen/verify_email_screen.dart';
import '../screen/welcome_screen/welcome_screen.dart';

class AppPages {
  static var list = [
    GetPage(name: SplashScreen.routes, page: () => const SplashScreen(), binding: SplashBinding()),
    GetPage(name: TutorialScreen.routes, page: () => const TutorialScreen(), binding: TutorialBinding()),
    GetPage(name: LoginScreen.routes, page: () => const LoginScreen(), binding: LoginBinding()),
    GetPage(name: ForgotPasswordScreen.routes, page: () => const ForgotPasswordScreen(), binding: ForgotPasswordBinding()),
    GetPage(name: VerifyEmailScreen.routes, page: () => const VerifyEmailScreen(), binding: VerifyEmailBinding()),
    GetPage(name: NewPasswordScreen.routes, page: () => const NewPasswordScreen(), binding: NewPasswordBinding()),
    GetPage(name: SignupScreen.routes, page: () => const SignupScreen(), binding: SignupBinding()),
    GetPage(name: LanguageChangeScreen.routes, page: () => const LanguageChangeScreen(), binding: LanguageChangeBinding()),
    GetPage(name: WelcomeScreen.routes, page: () => const WelcomeScreen(), binding: WelcomeBinding()),
    GetPage(name: MedicalScreen.routes, page: () => const MedicalScreen(), binding: MedicalBinding()),
    GetPage(name: SelectionScreen.routes, page: () => const SelectionScreen(), binding: SelectionBinding()),
    GetPage(name: MeasurementSelectionScreen.routes, page: () => const MeasurementSelectionScreen(), binding: MeasurementSelectionBinding()),
    GetPage(name: DailyReportScreen.routes, page: () => const DailyReportScreen(), binding: DailyReportBinding()),
    GetPage(name: HelpScreen.routes, page: () => const HelpScreen(), binding: HelpBinding()),
    GetPage(name: CommonScreen.routes, page: () => const CommonScreen(), binding: CommonBinding()),
    GetPage(name: ContactUsScreen.routes, page: () => const ContactUsScreen(), binding: ContactUsBinding()),
    GetPage(name: TabBarScreen.routes, page: () => const TabBarScreen(), binding: TabBarBinding()),
    GetPage(name: DeleteAccountScreen.routes, page: () => const DeleteAccountScreen(), binding: DeleteAccountBinding()),
    GetPage(name: DeleteConfirmScreen.routes, page: () => const DeleteConfirmScreen(), binding: DeleteConfirmBinding()),
    GetPage(name: ProfileScreen.routes, page: () => const ProfileScreen(), binding: ProfileBinding()),
    GetPage(name: EditProfileScreen.routes, page: () => const EditProfileScreen(), binding: EditProfileBinding()),
    GetPage(name: ChangePasswordScreen.routes, page: () => const ChangePasswordScreen(), binding: ChangePasswordBinding()),
    GetPage(name: MedicalHistoryScreen.routes, page: () => const MedicalHistoryScreen(), binding: MedicalHistoryBinding()),
    GetPage(name: NotificationsScreen.routes, page: () => const NotificationsScreen(), binding: NotificationsBinding()),
  ];
}
