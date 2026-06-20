package study.day01_20260619;

public class Employee {
    // フィールド（データ）
    String name;
    String department;
    int salary;

    // コンストラクタ
    Employee(String name, String department,int salary) {
        this.name = name;
        this.department = department;
        this.salary = salary;
    }
    // メソッド（操作）
    void showInfo() {
        System.out.println("名前：" + name);
        System.out.println("部署：" + department);
        System.out.println("給与：" + salary + "円");
    }
  }
