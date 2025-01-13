class Validation {

  static String validateEmail(String email) {
    if(email.isEmpty) {
      return 'Email should not empty';
    }
    return '';
  }

  static String validatePassword(String password) {
    if(password.isEmpty) {
      return 'Password should not empty';
    }
    return '';
  }

  static String validateName(String name) {
    if(name.isEmpty) {
      return 'First Name and Last Name should not empty';
    }
    return '';
  }

}