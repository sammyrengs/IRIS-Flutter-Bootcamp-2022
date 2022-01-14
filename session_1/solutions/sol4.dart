import 'dart:io';

class BranchElective{
  String branch = "";
  int year = 0;
  String courseName = "";
  String courseCode = "";
  BranchElective(String b, int y, String cname, String ccode){
    this.branch = b;
    this.year = y;
    this.courseName = cname;
    this.courseCode = ccode;
  }
}

class OpenElective{
  String courseName = "";
  String courseCode = "";
  OpenElective(String cname, String ccode){
    this.courseName = cname;
    this.courseCode = ccode;
  }
}

List<BranchElective> B = [];
List <OpenElective> O = [];

void initBranchEle(){
  B.add(BranchElective("CS", 1, "Discrete Mathematical Structures", "CS112"));
  B.add(BranchElective("CS", 2, "Graph Theory", "CS360"));
  B.add(BranchElective("CS", 3, "System Programming", "CS361"));
  B.add(BranchElective("CS", 4, "Computing Systems", "CS363"));
  B.add(BranchElective("EE", 1, "Analysis of Electric Circuits", "EE101"));
  B.add(BranchElective("EE", 2, "Commutator Machines", "EE253"));
  B.add(BranchElective("EE", 3, "Digital Systems Design", "EE313"));
  B.add(BranchElective("EE", 4, "Power System Harmonics", "EE311"));
  B.add(BranchElective("ME", 1, "Mechanics of Deformable Bodies", "ME113"));
  B.add(BranchElective("ME", 2, "Finite Element Method", "ME311"));
  B.add(BranchElective("ME", 3, "Mechatronic Systems", "ME313"));
  B.add(BranchElective("ME", 4, "Synthesis of Mechanisms", "ME413"));  
}

void initOpenEle(){
  O.add(OpenElective("Linear Algebra", "MA204"));
  O.add(OpenElective("Numerical Methods", "MA207"));
  O.add(OpenElective("Probability Theory", "MA208"));
}

void main(){
  initBranchEle();
  initOpenEle();
  print("Enter the type of user (1. Admin, 2. Student)");
  int u = int.parse(stdin.readLineSync()!);
  if(u==1){
    print("Enter the course type (1. Open Elective, 2. Branch Elective)");
    int t = int.parse(stdin.readLineSync()!);
    if(t==1){
      print("Enter course name");
      String cname = stdin.readLineSync()!;
      print("Enter course code");
      String ccode = stdin.readLineSync()!;
      O.add(OpenElective(cname, ccode));
      print("Course Successfully Added!");
      print("OPEN ELECTIVES");
      for(OpenElective be in O){
        print("${be.courseName} ${be.courseCode}");
      }
    } else{
      print("Enter branch (CS, EE, ME)");
      String b = stdin.readLineSync()!;
      print("Enter year (1,2,3,4)");
      int y = int.parse(stdin.readLineSync()!);
      print("Enter course name");
      String cname = stdin.readLineSync()!;
      print("Enter course code");
      String ccode = stdin.readLineSync()!;
      B.add(BranchElective(b, y, cname, ccode));
      print("Course Successfully Added!");
      print("BRANCH ELECTIVES");
      for(BranchElective be in B){
        if(be.branch == b && be.year == y){
          print("${be.courseName} ${be.courseCode}");
        }
      }
    }
  } else{
    print("Enter branch (CS, EE, ME)");
    String b = stdin.readLineSync()!;
    print("Enter year (1,2,3,4)");
    int y = int.parse(stdin.readLineSync()!);
    print("OPEN ELECTIVES:");
    for(OpenElective oe in O){
      print("${oe.courseName} ${oe.courseCode}");
    }
    print("BRANCH ELECTIVES");
    for(BranchElective be in B){
      if((be.branch == b) && (be.year == y)){
        print("${be.courseName} ${be.courseCode}");
      }
    }
  }
}