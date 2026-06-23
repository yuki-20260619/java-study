package study.java.day03_20260621;

public class Main {
    public static void main(String[] args) {
        //Employee[] employees = new Employee[3];
        Employee[] employees = new Employee[4]; // 課題３のため、要素数を変更

        employees[0] = new Employee("山田","営業部",300000);
        employees[1] = new Employee("佐藤","開発部",400000);
        employees[2] = new Employee("田中","人事部",350000);

        // 課題１
        System.out.println("課題１");

        employees[0].showInfo();
        System.out.println();

        employees[1].showInfo();
        System.out.println();

        employees[2].showInfo();
        System.out.println();

        // 課題２
        for (int i = 0; i < 3; i++) {
            if(i == 0) {
                System.out.println("課題２");
            }
            employees[i].showInfo();
            System.out.println();
        }

        // 課題３
        employees[3] = new Employee("鈴木","総務部",320000);

        for (int i = 0; i < employees.length; i++) {
            if (i == 0) {
                System.out.println("課題３");
            }
            employees[i].showInfo();
            System.out.println();
        }

    }
}
