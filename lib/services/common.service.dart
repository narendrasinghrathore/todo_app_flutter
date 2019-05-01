class AppValidator  {
  String _value;
  String _result;

  AppValidator(String val) {
    this._value = val;
  }

  get value {
    return _result;
  }

  AppValidator isRequired(String message) {
    if (_value.isEmpty) {
      _result = message;
    } else {
      _result = null;
    }
    return this;
  }

  AppValidator validateEmail(String message) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(_value))
      _result = message;
    else {
      _result = null;
    }
    return this;
  }

  
}
