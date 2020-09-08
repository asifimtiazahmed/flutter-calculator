import 'dart:math';

class CalcBrain {

  double _result;
  double _buffA = 0; //this is initialized because I use += in other places
  var _bufferA = [' '];
  int _decimalCheck = 0;
  String _currentDisp ;
  bool _getNextNum = false;
  bool _isSubtraction = false;
  bool _isMultiplication = false;
  bool _isDivision = false;
  bool _isModal = false;

//add a number to the buffer from the button
  void addNumber(String input) {
    (_getNextNum) ? _bufferA = [' '] : _bufferA = _bufferA; //if get next num is true then clear the display before adding new numbers
    (input == '.') ? _decimalCheck += 1 : _decimalCheck += 0; //if there is a decimal already then count it so that next ones can be filtered out

    if (_decimalCheck <= 1 && _bufferA.length <= 10) {
      _bufferA.add(input);
    } else if (_decimalCheck >= 2 && !(input == '.') && _bufferA.length <= 10) {
      _bufferA.add(input);
    }
    print('$_bufferA added');
    _getNextNum = false; //it is usually a one time thing.
  }

  //concat the string to one and return number
  String mergeString(List aList) {
    //double retVal;
    String oneString = ' ';
    if(aList.length > 1){
    for (int x = 0; x < aList.length; x++) {
      oneString += aList[x];
    }
    }
    print(oneString + ' merge string called');
    this._currentDisp = oneString;
    return oneString;
  }


  double convStringToDouble(String oneString) {
    print(oneString);
    (oneString == ' ') ? oneString = '0'  : oneString = oneString;
    double retVal = double.parse(oneString);
    _result = retVal;
    return retVal;
  }

  String display(){
    mergeString(_bufferA);

    print(_bufferA);
    convStringToDouble(_currentDisp);
    return _currentDisp;
  }

  void allFalse(String s){
    _isSubtraction = false;
    _isMultiplication = false;
    _isDivision = false;

    switch(s){
      case('_isSubtraction'):
        _isSubtraction = true;
        break;
      case('_isMultiplication'):
        _isMultiplication = true;
        break;
      case('_isDivision'):
        _isDivision = true;
        break;
      case('_isModal'):
        _isModal = true;
        break;
      default:
    }

  }
  void reset(){
    _bufferA=[' '];
    _decimalCheck = 0;
    _currentDisp = ' ';
    _result = 0.0;
    _buffA = 0.0;
    _getNextNum = false;
    _isSubtraction = false;
    _isMultiplication = false;
    _isDivision = false;
    _isModal= false;
  }

  void plusMinus(){
    String testFoNeg = _bufferA[0];
    for(int x = 1; x < _bufferA.length; x++){
      testFoNeg += _bufferA[x];
    }
    print('test for neg = $testFoNeg');
    double flip = double.parse(testFoNeg);
    flip = - flip;
    print(flip.toString());
    _result = flip;
    _bufferA = [' '];
    addNumber(flip.toString());
    allFalse('allFalse');

    //} else {
    //  (_bufferA[0] != '-') ? _bufferA[0] = '-' : _bufferA[0] = ' ';
    //}
  }

void mod(){
  if(_isModal){
    print('multi is true now.');
    _buffA =_buffA % _result;
  } else{
    _buffA += _result;
  }
  _bufferA=[' '];        //resets the buffers except buffA and B   display now showing <blank>
  _result = _buffA;// restores back the number in result;     result restored
  print(_result);
  addNumber(_result.toString()); //display the result
  _getNextNum = true;
  allFalse('_isModal');
}

void add(){
      _buffA += _result; //stores the current data in buffA       already typed the numbers thn pressed +
      _bufferA=[' '];        //resets the buffers except buffA and B   display now showing <blank>
      _result = _buffA;// restores back the number in result;     result restored
      print(_result);
      addNumber(_result.toString()); //this is to just display
      _getNextNum = true;
      //currentDisp = result.toString();


}

void subtr(){
   //stores the current data in buffA       already typed the numbers thn pressed +
  if(_isSubtraction){
    print('sub is true now.');
    _buffA -= _result;
  } else{
    _buffA += _result;
  }
  _bufferA=[' '];        //resets the buffers except buffA and B   display now showing <blank>
  _result = _buffA;// restores back the number in result;     result restored
  print(_result);
  addNumber(_result.toString()); //display the result
  _getNextNum = true;
  allFalse('_isSubtraction');

}

void multi(){
  if(_isMultiplication){
    print('multi is true now.');
    _buffA *= _result;
  } else{
    _buffA += _result;
  }
  _bufferA=[' '];        //resets the buffers except buffA and B   display now showing <blank>
  _result = _buffA;// restores back the number in result;     result restored
  print(_result);
  addNumber(_result.toString()); //display the result
  _getNextNum = true;
  allFalse('_isMultiplication');
}

void division(){
  if(_isDivision){
    print('div is true now.');
    _buffA /= _result;
  } else{
    _buffA += _result;
  }
  _bufferA=[' '];        //resets the buffers except buffA and B   display now showing <blank>
  _result = _buffA;// restores back the number in result;     result restored
  print(_result);
  addNumber(_result.toString()); //display the result
  _getNextNum = true;
  allFalse('_isDivision');
}

void equals(){
    print('eql calld');
  if(_isDivision){
    print('div is true now.');
    _buffA /= _result;
  } else if(_isMultiplication){
    print('multi is true now.');
    _buffA *= _result;
  } else if(_isSubtraction){
    print('sub is true now.');
    _buffA -= _result;
  } else if(_isSubtraction) {
    print('mod is true now.');
    _buffA = _buffA % _result;
  } else{
    _buffA += _result;
  }
  _getNextNum = true;
  _result = _buffA;
  addNumber(_result.toString());
}

}
