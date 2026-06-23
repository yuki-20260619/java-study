package study.java.day03_20260621_2;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Employee> employees = new ArrayList<>();

        employees.add(new Employee("山田","営業部",300000));
        employees.add(new Employee("佐藤","開発部",400000));
        employees.add(new Employee("田中","人事部",350000));

        // 課題１
        System.out.println("課題１");

        employees.get(0).showInfo();
        System.out.println();

        employees.get(1).showInfo();
        System.out.println();

        employees.get(2).showInfo();
        System.out.println();

        // 課題２
        employees.add(new Employee("鈴木","総務部",320000));

        System.out.println("課題２");
        employees.get(3).showInfo();
        System.out.println();

        // 課題３
        System.out.println("課題３");

        for (int i = 0; i < employees.size(); i++) {
            employees.get(i).showInfo();
            System.out.println();
        }

        // 課題４
        int totalSalary = 0;

        for (int i= 0; i < employees.size(); i++) {
            totalSalary += employees.get(i).getSalary();
        }

        System.out.println("給与合計：" + totalSalary + "円");
        System.out.println();

        // 課題５
        int maxSalary = 0;
        int getSalary = 0;

        for (int i =0; i < employees.size(); i++) {
            getSalary = employees.get(i).getSalary();

            if (getSalary > maxSalary) {
                maxSalary = getSalary;
            }
        }
        System.out.println("課題５");
        System.out.println("最高給与：" + maxSalary + "円");
        System.out.println();
    }
}
