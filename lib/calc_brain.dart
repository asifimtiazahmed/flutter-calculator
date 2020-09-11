class CalcBrain {
  List<String> _mainList = [' '];
  double _result = 0;
  String _outputString = '0';
  bool _switchInput = false;
  int isDecimal = 0;
  String lastUsedOperator;

  void reset() {
    _mainList = [' '];
    _result = 0;
    _outputString = '0';
    _switchInput = false;
    isDecimal = 0;
  }

  String filterInput(String input) {
    //print('filter decimal called');
    String filteredInput;
    String checkLast = _mainList.last;
    for (int x = 0; x < checkLast.length; x++) {
      (checkLast[x] == '.') ? this.isDecimal++ : this.isDecimal += 0;
    }
    (isDecimal > 0 && input == '.')
        ? filteredInput = ''
        : filteredInput = input; //allow the input to be passed
    return filteredInput;
  }

  void getInput(String input) {
    //print('get input called with input of $input');
    input = filterInput(input); //filter out the

    (input != '')
        ? _mainList.add(input)
        : print('$input not added to mainList'); //add the input to the mainList
    addToOutputString(_mainList); //send it to be displayed
  }

  String display() {
    //print('display called');
   // double output = double.tryParse(_outputString);
    String newOut = _outputString[0];
    //newOut +='.';
    if (_outputString.contains('.')) {
      String first = _outputString.substring(
          _outputString.indexOf('.'), _outputString.length);
      if (double.tryParse(first) == 0.0)
        _outputString = _outputString.substring(0, _outputString.indexOf('.'));
    }
    if (_outputString.length >= 10) {
      for (int i = 1; i < 10; i++) {
        newOut += _outputString[i];
      }
      _outputString = newOut;
    }
    return _outputString;
  }

  void addToOutputString(List inputS) {
    //print('add to output string method called with List $inputS ');
    _outputString =
        inputS[0]; //get the first spot to initialize the outputString
    for (int x = 1; x < inputS.length; x++) {
      _outputString += inputS[x];
    }
  }

  double stringToNumber(String toNum) {
    //print('string to num called');
    return double.parse(toNum);
  }

  void toggleSwitchInput() {
    (_switchInput = false) ? _switchInput = true : _switchInput = false;
    _mainList = [' '];
    isDecimal = 0;
  }

  void equals() {
    (lastUsedOperator != null)
        ? mainCalculator(lastUsedOperator)
        : lastUsedOperator = null;
    lastUsedOperator = null;
  }

  void mainCalculator(String operator) {
    switch (operator) {
      case ('+'):
        if (lastUsedOperator != '+') {
          _result = double.tryParse(_outputString); //resets result to 0
          //_result += stringToNumber(_outputString); //store whatever is in the display to result
        } else {
          _result += stringToNumber(_outputString);
          toggleSwitchInput();
        }
        lastUsedOperator = '+';
        //initializes mainlist with the result to string
        break;
      case ('-'):
        if (lastUsedOperator != '-') {
          _result = double.tryParse(_outputString); //resets result to 0
          //_result += stringToNumber(_outputString); //store whatever is in the display to result
        } else {
          _result -= stringToNumber(_outputString);
        }
        toggleSwitchInput();
        lastUsedOperator = '-';
        break;
      case ('x'):
        if (lastUsedOperator != 'x') {
          _result = double.tryParse(_outputString); //resets result to 0
          //_result += stringToNumber(_outputString); //store whatever is in the display to result
        } else {
          _result *= stringToNumber(_outputString);
        }
        toggleSwitchInput();
        lastUsedOperator = 'x';
        break;
      case ('÷'):
        if (lastUsedOperator != '-') {
          _result = double.tryParse(_outputString); //resets result to 0
          //_result += stringToNumber(_outputString); //store whatever is in the display to result
        } else {
          _result /= stringToNumber(_outputString);
        }
        toggleSwitchInput();
        lastUsedOperator = '÷';
        break;
      case ('%'):
        if (lastUsedOperator != '-') {
          _result = double.tryParse(_outputString); //resets result to 0
          //_result += stringToNumber(_outputString); //store whatever is in the display to result
        } else {
          _result %= stringToNumber(_outputString);
        }
        toggleSwitchInput();
        lastUsedOperator = '%';
        break;
      default:
    }
    _mainList = [_result.toString()];
    addToOutputString(_mainList);
    _mainList = [' '];
    isDecimal = 0; // newly added
  }

  void plusMinus() {
    _outputString = (-double.tryParse(_outputString)).toString();
    _mainList = [_outputString];
    addToOutputString(_mainList);
    _mainList = [' '];
  }
}
