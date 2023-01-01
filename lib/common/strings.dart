class Strings {
  ///************** Common String **************///
  /// NOTE: Don't remove this Strings ---------->>>
  static const String appName = "UPWATCH";
  static const String ok = "Ok";
  static const String yes = "Yes";
  static const String no = "No";
  static const String cancel = "Cancel";
  static const String done = "Done";
  static const String or = "Or";
  static const String add = "Add";
  static const String loading = "Loading....";
  static const String interNetNotAvailable = "Your internet is not available, please try again later";
  static const String apiError = "Something went wrong, Please try again...";
  static String? couldNotLodeImageTapToRetry = "Couldn't lode image. Tap to retry.";
  static const String logoutMessage = "Are you sure want to logout from app?";
  static const String apply = "Apply";
  static const String submit = "Submit";
  static const String search = "Search";
  static const String clear = "Clear";
  static const String login = "Login";
  static const String logout = "Logout";
  static const String deleteAccount = "Delete Account";
  static const String send = "Send";
  static const String verify = "Verify";
  static const String save = "Save";
  static const String camera = "Camera";
  static const String gallery = "Gallery";
  static const String commonEmptyMessage = "No data found.";
  static const String dummyTest =
      "m Ipsum has been the industry's standards dummy text ever since the 1501 when unknown printer took a galley of type and scrambled it's \n\nIt was popularized in the 1960s with the release of Letterset sheets containing Lorem Ipsum it's passages, and more recently with desktop this publishing software like Aldus Page including a versions of Lorem Ipsum.\n\nm Ipsum has been the industry's standards dummy text ever since the 1501 when unknown printer took a galley of type and scrambled it's \n\nIt was popularized in the 1960s with the release of Letterset sheets containing Lorem Ipsum it's passages, and more recently with desktop this publishing software like Aldus Page including a versions of Lorem Ipsum.";
  static const String demoTextDic =
      "Lorem Ipsum has been the industry's standards dummy text ever since the 1500s, when and it's unknown printer took a galley of type and very  has survived not only five centuries, but also its  of passages of Lorem Ipsum available, but this majority have suffered alteration in some form, by injected human, or randomised word which don't look even slightly believable.";

  ///************** Tutorial Screen **************///
  static const String tutorialPage1Title = "Lorem ipsum ami adipiscing";
  static const String tutorialPage1TitleSub = "Lorem Ipsum is simply dummy text of to the printing and typesetting industry.";
  static const String tutorialPage2Title = "There are many it variations of";
  static const String tutorialPage2TitleSub = "It is a long established fact that a reader will be distracted by the layout.";
  static const String tutorialPage3Title = "Contrary belief to lorem Ipsum";
  static const String tutorialPage3TitleSub = "Lorem Ipsum has been the industry type specimen book.";

  ///************** Login Screen **************///
  static const String helloThereLogin = "Hello there, please login first 👋";
  static const String email = "Email";
  static const String password = "Password";
  static const String forgotPassword = "Forgot Password?";
  static const String signUp = "Sign Up";
  static const String loginWithDifferentAccounts = "Login with different accounts";
  static const String doNotAccount = "Don’t have an account?";
  static const String hintEmail = "Enter Email";
  static const String hintPassword = "Enter Password";

  static const String errorMessageEmail = "Please enter email.";
  static const String errorMessageValidEmail = "Please enter valid email.";
  static const String errorMessagePassword = "Please enter password.";

  ///************** Forgot Password Screen **************///
  static const String forgotPasswordTitle = "Forgot Password";
  static const String forgotPasswordDes = "Don’t worry! It happens. Please enter the address associated with your account";
  static const String rememberYourPassword = "You remember your password?";

  ///************** Verify Email Screen **************///
  static const String verifyYourEmail = "Verify Your Email";

  static String pleaseEnter(String email) {
    return "Please enter the 4 digit code sent to $email";
  }

  ///************** Create New Password Screen **************///
  static const String createNewPassword = "Create New Password";
  static const String yourNewPassword = "Your new password must be different from previously used password.";
  static const String hintNewPassword = "Enter New Password";
  static const String hintConfirmPassword = "Enter Confirm Password";

  ///************** Sign Up Screen **************///
  static const String letsGetStarted = "Let's Get Started!";
  static const String createAnAccount = "Create an account to upwatch to get all features";
  static const String confirmPassword = "Confirm Password";
  static const String name = "Name";
  static const String hintName = "Enter Name";
  static const String gender = "Gender";
  static const String dob = "Date of Birth";
  static const String month = "Month";
  static const String monthly = "Monthly";
  static const String day = "Day";
  static const String year = "Year";
  static const String yearly = "Yearly";
  static const String iAgreeToThe = "I agree to the";
  static const String termsCondition = "Terms & Conditions";
  static const String and = " and ";
  static const String privacyPolicy = "Privacy Policy.";
  static const String alreadyAccount = "Already have an account?";

  ///************** Home Screen **************///

  ///************** Change Password Screen **************///
  static const String currentPassword = "Current Password";
  static const String newPassword = "New Password";
  static const String enterCurrentPassword = "Please enter current password.";
  static const String enterNewPassword = "Please enter new password.";
  static const String enterConfirmPassword = "Please enter confirm password.";
  static const String notMatchNewPassword = "Passwords does not match.";
  static const String enterValidCurrentPassword = "Current Password must contain 6 characters.";
  static const String enterValidNewPassword = "New Password must contain 6 characters.";

  ///************** My Profile Screen **************///
  static const String logoutConfirmation = "Are you sure you want to logout?";
  static const String setting = "Setting";

  ///************** Language Selection Screen **************///
  static const String chooseTheLanguage = "Choose The Language";
  static const String selectYourLanguage = "Select your language";
  static const String select = "Select";
  static const String traditionalChinese = "Traditional\nChinese";
  static const String english = "English";

  ///************** Welcome Screen **************///
  static const String welcomeToUpWatch = "Welcome to UpWatch";
  static const String thankYouForJoining = "Thank you for joining with us.";
  static const String continueLabel = "Continue";

  ///************** Medical History/ Body Measurement Screen **************///
  static const String medicalHistory = "Medical History";
  static const String loremText = "lorem ipsum dummy text";
  static const String go = "Go";
  static const String bodyMeasurement = "Body Measurement";
  static const String bodyHeight = "Body Height";
  static const String bodyWeight = "Body Weight";

  ///************** Selection Screen **************///
  static const String step = "Step";
  static const String back = "Back";
  static const String enterNumber = "Enter Number";

  static String stepCount(String current, String total) {
    return "Step $current/$total";
  }

  ///************** Selection Screen **************///
  static const String dailyReport = "Daily Report";

  static const String bloodGlucose = "Blood Glucose";
  static const String bloodOxygen = "Blood Oxygen";
  static const String bloodPressure = "Blood Pressure";
  static const String bloodBodyTemperature = "Body Temperature";
  static const String bloodBodyWeight = "Body Weight";
  static const String systolic = "Systolic";
  static const String diastolic = "Diastolic";
  static const String getStarted = "Get Started";

  static const String hintBloodGlucose = "Enter Blood Glucose";
  static const String hintBloodOxygen = "Enter Blood Oxygen";
  static const String hintBloodPressure = "Enter Blood Pressure";
  static const String hintBodyTemperature = "Enter Body Temperature";
  static const String hintBodyWeight = "Enter Body Weight";

  ///************** Help Screen **************///
  static const String getHelp = "Get Help";
  static const String aboutUs = "About Us";
  static const String contactUs = "Contact Us";
  static const String helpLegal = "Help & Legal";
  static const String privacyPolicyLabel = "Privacy Policy";
  static const String securityPolicy = "Security Policy";

  ///************** Common Screen **************///
  static const String dummyText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore "
      "magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  ///************** Contact Us Screen **************///
  static const String subject = "Subject";
  static const String message = "Message";
  static const String hintSubject = "Enter Subject";

  ///************** Settings Screen **************///
  static const String myProfile = "My Profile";
  static const String healthDataRecordSetting = "Health Data Record Setting";
  static const String dashboardSetting = "Dashboard Setting";
  static const String smartwatchConnection = "Smartwatch Connection";
  static const String healthAppConnection = "Health App Connection";
  static const String language = "Language";

  ///************** Delete Account Screen **************///
  static const String iDoNotLike = "I Don't Like Upwatch";
  static const String someErrorForThisApp = "Some Error For This Application";
  static const String other = "Other";
  static const String typeWhyYouLeave = "Type Why You Leave Upwatch";
  static const String typeDelete = "Type “Delete” to Confirm";
  static const String confirm = "Confirm";
  static const String delete = "Delete";

  ///************** Smart Watch Screen **************///
  static const String goodEvening = "Good Evening";
  static const String smartWatchDesc = "If you have an Smart Watch, you can pair it with your phone here.";
  static const String startPairing = "Start Pairing";

  ///************** Health App Screen **************///
  static const String connectHealthApp = "Connect the health App";
  static const String dummyLoremDesc = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";

  static const String deleteAccountConfirmation = "Are you sure you want to delete account?";

  ///************** Home Screen **************///
  static const String hello = "Hello,";
  static const String haveNiceDay = "Have A Nice Day!";
  static const String dailyHealthReport = "Daily Health Report";
  static const String enterTodayRecord = "Enter Today’s Record";
  static const String addData = "Add Data";
  static const String weeklyAverage = "Weekly Average";
  static const String mgDl = "mg/dl";
  static const String mmHg = "mmHg";
  static const String bodyTemperature = "Body Temperature";
  static const String degree = "Degree";

  static const String kg = "Kg";

  ///************** Profile Screen **************///
  static const String age = "Age";
  static const String male = "Male";
  static const String editProfile = "Edit Profile";

  ///************** Edit Profile Screen **************///
  static const String changePassword = "Change Password";

  ///************** Change Password Screen **************///
  static const String hintCurrentPassword = "Enter Current Password";
  static const String confirmNewPassword = "Confirm New Password";
  static const String hintConfirmNewPassword = "Enter Confirm New Password";
  static const String update = "Update";

  ///************** MedicalHistory Screen **************///
  static const String haveYouBeenDiagnosed = "Have you been diagnosed\nwith the following conditions?";
  static const String highCholesterol = "High Cholesterol";
  static const String diabetes = "Diabetes";
  static const String highBloodPressure = "High Blood Pressure";
  static const String strokeHistory = "Stroke history";
  static const String alcoholStatus = "Alcohol Status";
  static const String noButIUsedDrink = "No, but I used to drink";
  static const String noButIUsedSmoke = "No, but I used to smoke";
  static const String weeklyAlcoholIntake = "Weekly Alcohol Intake\n(Standard alcohol Unit)";
  static const String standardAlcoholUnit = "(Standard alcohol Unit)";
  static const String smokingStatus = "Smoking Status";
  static const String weeklyTobaccoIntake = "Weekly Tobacco Intake (Packs)";

  /// Health details screen
  static const String today = "Today";
  static const String week = "Week";
  static const String sixMonth = "Six Month";
  static const String weeklyAvg = "Weekly Avg";
  static const String weeklyBlood = "Weekly Blood";
  static const String weekly = "Weekly";

  /// Mobility
  static const String totalCompositeScore = "Total Composite Score";
  static const String walkingSpeed = "Walking Speed";
  static const String usual = "Usual";
  static const String maximal = "Maximal";
  static const String cadence = "Cadence";
  static const String walkingQuality = "Walking Quality";
  static const String stepTimeVariability = "Step-time Variability";
  static const String harmonicRatio = "Harmonic Ratio";
  static const String stepRegularity = "Step Regularity";
  static const String physicalActivityLevel = "Physical Activity Level";
  static const String runningDuration = "Running Duration";
  static const String strpCount = "Strp Count";
  static const String step_Count = "Step Count";
  static const String longestWalk = "Longest Walk";
  static const String maxSpeed = "Max Speed";
  static const String usualSpeed = "Usual Speed";
  static const String longestWalkingDuration = "Longest Walking Duration";
  static const String walkingPerformanceProgress = "Walking Performance Progress";
  static const String walksSccond = "Walks > 7 sccond";

  ///Disease Risk Screen
  // static const String diseaseRisk = "Disease Risk";
  static const String diseaseRisk = "Disease Risks";
  static const String fallRisk = "Fall Risk";
  static const String strokeRisk = "Stroke Risk";
  static const String dementiaRisk = "Dementia Risk";
  static const String dementiaRisks = "Dementia Risks";
  static const String pakinsonRisk = "Pakinson's Risk";

  /// Dashboard setting
  static const String healthData = "Health Data";
  static const String mobilityScores = "Mobility Scores";
  // static const String mobility = "Mobility";
  static const String mobility = "Mobility Scores";

  static const String notifications = "Notifications";
}
