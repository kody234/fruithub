class FormValidation {
  String? defaultFormValidator(String? input) {
    if (input == '') {
      return 'Cant leave empty';
    }
    return null;
  }

  String? passwordValidator(String? input) {
    if (input == '') {
      return 'Password is required';
    }
    if (input!.length < 6) {
      return 'Password should\'nt be less than 6 characters';
    }
    return null;
  }

  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty) {
      return 'E-mail address is required';
    }

    String pattern = r'\w+@\w+\.\w+';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(formEmail)) {
      return 'Invalid E-mail address format';
    }

    return null;
  }
}
