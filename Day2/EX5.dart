/*
Bai tap GPT ax^2 + bx+c=0;
*/
  import 'dart:io';
  import 'dart:math';
void main() {
  double a=0, b=0, c=0;
//input a  
  do{
    stdout.write('nhap he so a (a khac 0)');
    String? input = stdin.readLineSync();
    if(input!=null)
    {
      a=double.tryParse(input) ?? 0;
    }
    if(a==0){
      print('vui long nhap lai');
    }

  }while(a==0);

  //input b c
    stdout.write('nhap he so b ');
    String? inputB = stdin.readLineSync();
    if(inputB!=null)
    {
      b=double.tryParse(inputB) ?? 0;
    }
    stdout.write('nhap he so b ');
    String? inputC = stdin.readLineSync();
    if(inputC!=null)
    {
      b=double.tryParse(inputC) ?? 0;
    }

    //tinh delta
    double delta = b*b-4*a*c;
      //Hien thi phuong trinh
      print('phuong trinh : ${a}x^2 + ${b}x + $c =0 ');
    //gpt

    if(delta<0 ){
      print('Phuong trinh vo nghiem');
    }else if(delta == 0){
      double x= -b/(2*a);
      x= double.parse(x.toStringAsFixed(2));
      print('phuong trinh co nghiem x= $x');
    }else{
      double x1=(-b + sqrt(delta))/(2*a);
      double x2=(-b - sqrt(delta))/(2*a);
      print('phuong trinh co 2 nghiem phan biet');
      print('x1=$x1');
      print('x2=$x2');
    }

}