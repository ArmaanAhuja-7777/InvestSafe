import 'dart:io';

void main(){
  performTasks(); 
}


void performTasks() async {
  task1(); 
  String task2Result = await task2(); 
  task3(task2Result); 
}


void task1(){
  String result = 'task 1 data'; 
  print("task 1 complete"); 
}
Future task2() async {



  Duration duration = Duration(seconds: 3); 

  String result = ''; 

  // sleep(duration); 
 await Future.delayed(duration,(){
       result = 'task 2 data'; 
 
  print("task 2 complete");
  } ); 

  return result; 
}
void task3(String task2result){
  String result = 'task 3 data'; 
  print("task 3 complete" + task2result); 
}