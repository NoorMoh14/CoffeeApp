import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';

class AppStrings {
  // static const noRouteFound = "No Route Found";
  // static const onBoardingTitle1 = "Upload New Project";
  // static const onBoardingTitle2 = "Visual feed";
  // static const onBoardingTitle3 = "Protection & Privacy";
  // static const domin = "http://majdm0-001-site1.ctempurl.com/";
  // static const dominV2 = "majdm0-001-site1.ctempurl.com";
  static const onBoardingSubtitle1 = "Welcome to Tokoto , Let's shop ?";
  static const onBoardingSubtitle2 =
      "We show the easy way to shop. Just stay at home with us";
  static const onBoardingSubtitle3 =
      "We help people conect with store ground United State of America";
  static final storage = GetStorage();
  // // Login TextField
  // static final emailLogin = TextEditingController();
  // static final passwordLogin = TextEditingController();
  // static final emailConfirm = TextEditingController();
  // static final codeConfirm = TextEditingController();
  // static final passwordConfirm = TextEditingController();
  // static final oldPassword = TextEditingController();
  // static final confirmPasswordConfirm = TextEditingController();
  // //Create Account TextField
  // static final firstNameCreate = TextEditingController();
  // static final lastNameCreate = TextEditingController();
  // static final emailCreate = TextEditingController();
  // static final passwordCreate = TextEditingController();
  // static final confirmPasswordCreate = TextEditingController();
  // static final birthDayCreate = TextEditingController();
  // static final phoneCreate = TextEditingController();
  // static final cityCreate = TextEditingController();
  // static final countryCreate = TextEditingController();
  // static final userNameCreate = TextEditingController();
  static final EmailCreate = TextEditingController();
  static final PasswordCreate = TextEditingController();
  static final PasswordConCreate = TextEditingController();
  static final NameCreate = TextEditingController();
  // // Search TextField
  //Login Controller
  static final EmailLogin = TextEditingController();
  static final PasswordLogin = TextEditingController();

  static final TableNo = TextEditingController();

  // static final searchController = TextEditingController();
  // Key Sign up Form
  static final GlobalKey<FormState> signUpFromKey = GlobalKey<FormState>();
  // Key Login Form
  static final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> OrderCheckoutFromKey =
      GlobalKey<FormState>();
}
