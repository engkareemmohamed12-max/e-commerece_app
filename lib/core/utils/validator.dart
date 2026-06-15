class AppValidators {
  AppValidators._(); // منع إنشاء instance

  // الاسم
  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'this field is required';
    }
    if (value.trim().length < 3) {
      return 'name most be at least 3 letters';
    }
    return null;
  }

  // الإيميل
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'email required';
    }

    final emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return 'incorrect email';
    }

    return null;
  }

  // الباسورد
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'password required';
    }

    if (value.length < 6) {
      return 'password most be at least 6 letters';
    }

    return null;
  }

  // تأكيد الباسورد
  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'confirm password required';
    }

    if (value != password) {
      return 'the password not match';
    }

    return null;
  }

  // رقم الموبايل (مصر)
  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'phone number required';
    }

    final phoneRegex = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');

    if (!phoneRegex.hasMatch(value.trim())) {
      return 'phone number not match';
    }

    return null;
  }


}