class LoginValidator{
static String? validateEmail(String? value)
  {
  if (value == null || value.isEmpty) {
    return ' email is empty ! ';
  }

  if (!value.contains('@'))
  {
      return 'pleas inter a value email address';
  }
  return null ;
   }


  static String? validatePassword(String? value)
  {
    if (value == null || value.isEmpty) {
      return ' password is empty ! ';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }


static String? validatename(String? value)
{
  if (value == null || value.isEmpty) {
    return ' Name is empty ! ';
  }
}

}