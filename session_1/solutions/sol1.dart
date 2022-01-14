import 'dart:io';
void main(){
  print("Enter the value of n:");
  int n = int.parse(stdin.readLineSync()!);
  fibb(n);
}

void fibb(int n){
  int f1 = 0;
  int f2 = 1;
  int temp = f2;
  for(int i=1;i<=n;i++){
    print(f1);
    f2 = f1 + f2;
    f1 = temp;
    temp = f2;
  }
}
