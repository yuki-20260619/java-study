package study.java.day08_20260627;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

public class Main {
    public static void main(String[] args) {
        LocalDate today = LocalDate.now();

        // 課題１：LocalDate
        System.out.println("課題１：LocalDate");
        System.out.println(today);
        System.out.println();

        // 課題２：LocalDateTime
        LocalDateTime now = LocalDateTime.now();

        System.out.println("課題２：LocalDateTime");
        System.out.println(now);
        System.out.println();

        // 課題３：日付フォーマット
        System.out.println("課題３：日付フォーマット");
        DateTimeFormatter formatter =
                DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");

        System.out.println(now.format(formatter));
        System.out.println();

        // 課題４：Mathクラス
        System.out.println("課題４：Mathクラス");
        System.out.println(Math.max(15,8));
        System.out.println(Math.min(15,8));
        System.out.println(Math.abs(-20));
        System.out.println(Math.pow(2,3));
        System.out.println(Math.sqrt(81));
        System.out.println();

        // 課題５：Random
        System.out.println("課題５：Random");
        Random random = new Random();
        System.out.println(random.nextInt(10));
        System.out.println();

        // 課題６：StringBuilder
        System.out.println("課題６：StringBuilder");
        StringBuilder sb = new StringBuilder();

        /* StringBuilder.append()はオーバーロード（メソッドの多重定義）されている。
           そのため、文字列だけでなく数値や審議地などもそのまま追加できる。

           ・ append(String)
           ・ append(int)
           ・ append(double)
           ・ append(boolean)
           ・ append(char)
         */

        sb.append("Java");
        sb.append("学習");
        sb.append("Day08・");
        sb.append(100);

        System.out.println(sb.toString());
        System.out.println();

    }
}
