class FormValidation {
  String? defaultFormValidator(String? input) {
    if (input == null) {
      return 'provide your name to proceed';
    }
    return null;
  }
}
