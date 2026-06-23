package study.java.day03_20260621;

public class Employee {
    // フィールド（データ）
    private String name;
    private String department;
    private int salary;

    // コンストラクタ
    public Employee(String name, String department, int salary){
        this.name = name;
        this.department = department;
        this.salary = salary;
    }

    // メソッド（操作）
    // day01復習
    public void showInfo(){
        System.out.println("名前：" + name);
        System.out.println("部署：" + department);
        System.out.println("給与：" + salary + "円");
    }

    // day02復習
    // getter
    public String getName() {
        return name;
    }
    public String getDepartment(){
        return department;
    }
    public int getSalary(){
        return salary;
    }

    // setter
    public void setName(String name){
        this.name = name;
    }
    public void setDepartment(String department){
        this.department = department;
    }
    public void setSalary(int salary){
        this.salary = salary;
    }

    // 昇給：課題３
    //public void raiseSalary(int amount) {
    //    salary += amount;
    //}

    // 昇給：課題４（課題３をコメントアウト）
    public void raiseSalary(int amount) {
        if(amount <= 0) {
            System.out.println("昇給額は１円以上を指定してください");
        } else {
            salary += amount;
        }
    }

    // 課題５
    public void transferDepartment(String newDepartment){
        department = newDepartment;
    }
}
