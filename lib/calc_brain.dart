
class CalcBrain {

  double result;
  var bufferA = [' '];
  var bufferB = ['0'];
  int decimalCheck = 0;
  String currentDisp ;


//add a number to the buffer from the button
  void addNumber(String input) {
    (input == '.') ? decimalCheck += 1 : decimalCheck += 0;

    if (decimalCheck <= 1 && bufferA.length <= 10) {
      bufferA.add(input);
    } else if (decimalCheck >= 2 && !(input == '.') && bufferA.length <= 10) {
      bufferA.add(input);
    }
    print(bufferA);
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
    this.currentDisp = oneString;
    return oneString;
  }


  double convStringToDouble(String oneString) {
    double retVal = double.parse(oneString);
    return retVal;
  }

  String display(){
    mergeString(bufferA);
    return currentDisp;
  }

  void reset(){
    bufferA=[' '];
    decimalCheck = 0;
    currentDisp = ' ';

  }

}
