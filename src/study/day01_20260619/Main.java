package study.day01_20260619;

public class Main {
    public static void main(String[] args) {
        // 2026/6/19
        // 課題１
        //Product product = new Product();

        //product.name="マウス";
        //product.price=2500;

        //System.out.println("課題１");
        //product.showInfo();

        // 課題２
        //Employee employee= new Employee();

        //employee.name="山田";
        //employee.department="営業部";
        //employee.salary=300000;

        //System.out.println("課題２");
        //employee.showInfo();

        // 課題３
        //Employee employee1 =new Employee();

        //employee1.name = "山田";
        //employee1.department = "営業部";
        //employee1.salary = 300000;

        //System.out.println("課題３");
        //employee1.showInfo();

        //Employee employee2 = new Employee();

        //employee2.name = "佐藤";
        //employee2.department = "開発部";
        //employee2.salary = 400000;

        //employee2.showInfo();

        // 課題４：コンストラクタ追加のため、課題１～３をコメントアウト
        Employee employee1 = new Employee("山田","営業部",300000);
        Employee employee2 = new Employee("佐藤","開発部",400000);

        System.out.println("課題４");
        employee1.showInfo();
        employee2.showInfo();
    }
}