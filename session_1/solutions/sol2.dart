import 'dart:io';
void main(){
  print("Enter the value of n:");
  int n = int.parse(stdin.readLineSync()!);
  semiprime(n);
}

void semiprime(int n){
  int count = 0;
  for(int i=2; count<2 && i*i<=n;i++){
    while(n%i==0){
      n = (n/i).floor();
      count++;
    }
  }
  if(n>1){
    count++;
  }
  if(count == 2){
    print("True");
  }
  else{
    print("False");
  }
}
