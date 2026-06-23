package study.java.day02_20260620;

public class Main {
    public static void main(String[] args) {
        Employee employee1 = new Employee("山田","営業部",300000);
        Employee employee2 = new Employee("佐藤","開発部",400000);

        // day01復習
        employee1.showInfo();
        System.out.println();
        employee2.showInfo();

        // 課題１
        System.out.println();
        System.out.println("課題１");
        System.out.println("名前：" + employee1.getName());
        System.out.println("部署：" + employee1.getDepartment());
        System.out.println("給与：" + employee1.getSalary() + "円");

        // 課題２
        System.out.println();
        System.out.println("課題２");

        employee1.setName("田中");
        employee1.setDepartment("人事部");
        employee1.setSalary(350000);

        employee1.showInfo();

        // 課題３
        System.out.println();
        System.out.println("課題３");

        employee1.raiseSalary(20000);

        employee1.showInfo();

        // 課題４
        System.out.println();
        System.out.println("課題４：異常値の場合");

        employee1.raiseSalary(-1000000);
        employee1.showInfo();

        System.out.println();
        System.out.println("課題４：正しい値の場合");

        employee1.raiseSalary(10000);
        employee1.showInfo();

        // 課題５
        System.out.println();
        System.out.println("課題５");

        employee1.transferDepartment("総務部");
        employee1.showInfo();
    }
}
