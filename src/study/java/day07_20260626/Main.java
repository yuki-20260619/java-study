package study.java.day07_20260626;

public class Main {
    public static void main(String[] args) {
        int a = 10;
        int b = 0;

        // エラー部分
//        System.out.println(a / b);
//        System.out.println("終了");

        // 課題１：例外を捕まえる
        System.out.println("課題１：例外を捕まえる");
        try {
            System.out.println(a / b);
        } catch (ArithmeticException e) {
            System.out.println("0では割れません。");
        }

        System.out.println("終了");
        System.out.println();

        // 課題２：配列の例外
        System.out.println("課題２：配列の例外");

        int[] numbers ={10, 20, 30};

        try {
            System.out.println(numbers[5]);
        } catch (ArrayIndexOutOfBoundsException e) {
            System.out.println("配列の範囲外です。");
        }

        System.out.println("終了");
        System.out.println();

        // 課題３：複数の例外処理
        System.out.println("課題３：複数の例外処理");
        try {
            // 0割りのエラーを解消後は配列外の例外処理になる
            System.out.println(a / b);
            System.out.println(numbers[5]);
        }
        catch (ArithmeticException e) {
            System.out.println("0では割れません。");
        }
        catch (ArrayIndexOutOfBoundsException e) {
            System.out.println("配列の範囲外です。");
        }

        System.out.println("終了");
        System.out.println();

        // 課題４：finaly
        System.out.println("課題４：finaly");

        try {
            System.out.println(a / b);
        } catch (ArithmeticException e) {
            System.out.println("0では割れません。");
        } finally {
            System.out.println("後片付けをします。");
        }

        System.out.println("終了");
        System.out.println();
    }
}
