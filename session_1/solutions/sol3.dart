import 'dart:io';
List <bool> prime = List.filled(100000, true);
void main(){
  seive();
  print("Enter the number of elements in the array:");
  int n = int.parse(stdin.readLineSync()!);
  print("Enter the elements (each in a separate line):");
  List <int> a = [];
  for(int i=0;i<n;i++){
    int x = int.parse(stdin.readLineSync()!);
    a.add(x);
  }
  print(checkSum(a, n));
}
void seive(){
  prime[0] = false;
  prime[1] = false;
  for(int i=0; i<100000; i++){
    if(prime[i]){
      for(int j = i*i; j<100000; j+=i){
        prime[j] = false;
      }
    }
  }
}

bool checkSum(List <int> a, int n){
  int sum = 0;
  for(int i=0;i<n;i++){
    if(prime[a[i]]){
      sum += a[i];
    }
  }
  return prime[sum];
}