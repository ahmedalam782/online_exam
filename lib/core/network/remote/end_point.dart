class EndPoint {
  static const String baseUrl = 'https://exam.elevateegy.com/api/v1/';
  static const String signIn = 'auth/auth/signin';
  static const String register = 'auth/auth/signup';
  static const String changePassword = "auth/changePassword";
  static const String deleteMe = "auth/deleteMe";
  static const String logout = "auth/logout";
  static const String editProfile = "auth/editProfile";
  static const String profileData = "auth/profileData";
  static const String forgotPassword = "auth/forgotPassword";
  static const String verifyResetCode = "auth/verifyResetCode";
  static const String resetPassword = "auth/resetPassword";
  static const String exams = "exams";
  static const String questions = "questions";
  static const String questionsHistory = "questions/history";
  static const String questionsCheck = "questions/check";
  static const String subjects = "subjects";
}

class ApiKey {
  static const String code = 'code';
  static const String message = 'message';
  static const String error = 'error';
  static const String subject = 'subject';
  static const String exam = 'exam';
  static const String authorization = 'Authorization';
}
