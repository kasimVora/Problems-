import 'dart:isolate';

void main() {

// List l = ["d",3,"d",{"dd":"dd"},33.3];
// isolateExample();

}



void isolateExample() async{
  ReceivePort receivePort = ReceivePort();

  await Isolate.spawn(isolateFunction, [receivePort.sendPort,10]);

  print(" from isolate function ${ await receivePort.first}");
}

void isolateFunction(List<dynamic> args){

  SendPort sendPort = args[0];

  print("from internal function  ${args[1].toString()}");

  sendPort.send(1);

}


void swap(){
  int a = 43, b = 34;

  a = a+b;
  b = a-b;
  a = a-b;

  print(a);
  print(b);
}

void findDuplicates(){
  List<int> arr = [3,9,54,4,2,5,88,9,8,11,54,46,99,45,11,3,3,54];
  List dup = [];

  for(int i = 0;i<arr.length;i++){
    for(int j = i+1;j<arr.length;j++){
      if(arr[j]  == arr[i] ){
        dup.add(arr[j]);
      }
    }
  }

  print(dup);
}

void findPairOfSum(){
  //find all pairs of an integer array whose sum is equal to a given number

  int value = 20;

  List<int> arr = List.generate(50, (i) => i+1);


  for(int i = 0;i<arr.length;i++){
    for(int j = i+1;j<arr.length;j++){
      if(arr[j]+arr[i] == value){
        print(" ${arr[i]}  && ${arr[j]}");
      }
    }
  }


}

void sortArray(){
  List<int> arr = [3,9,4,2,5,88,46,99,45,11,54];


  int temp = 0;

  for(int i = 0;i<arr.length;i++){
    for(int j = i+1;j<arr.length;j++){
      if(arr[j]<arr[i]){
        var t  = arr [j];
        arr [j] = arr[i];
        arr[i] = t;
      }
    }
  }

  print(" sorted $arr");
}

void findMaxMin(){
  List<int> arr = [3,9,4,2,5,88,46,99,45,11,54];

  int max = arr[0] ,min = arr[0];


  for(int i = 0;i<arr.length;i++){
    if(arr[i]>max){
      max = arr[i];
    } if(arr[i]<min){
      min = arr[i];
    }
  }

  print(" max $max");
  print(" min $min");
}



void findFirstMaxSecondMax() {
  int fM,sM;
  List<int> arr = [10, 5, 8, 20, 9, 15];
  fM = arr[0];
  sM = arr[1];

  for(int i = 0;i<arr.length;i++){
    if(arr[i]>fM){
      sM = fM;
      fM = arr[i];
    }else if(arr[i]>sM){
      sM = arr[i];
    }

  }


  print("First max $fM");
  print("Second max $sM");

}