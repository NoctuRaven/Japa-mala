class Validators {
  String? nameMantraValidator(String? name) {
    if (name == null || name == "") {
      return "This field can't be empty";
    }
    return null;
  }

  String? counterMantraValidator(String? counterNumber) {
    var number = int.tryParse(counterNumber ?? "f");
    if (number == null) {
      return "Invalid value";
    }
    return null;
  }
}
