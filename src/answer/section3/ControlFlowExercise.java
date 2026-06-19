package answer.section3;

public class ControlFlowExercise {
    public static void main(String[] args) {
        int num = 7; // チェックする整数を定義（ここでは 7）

        // 演習1: if-else を使った偶数・奇数の判定
        // num を 2 で割った余りをチェックし、偶数なら "Even"、奇数なら "Odd" を表示する
        if (num % 2 == 0) {
            System.out.println("Even"); // 偶数の場合
        } else {
            System.out.println("Odd"); // 奇数の場合
        }

        // 演習2: switch 文を使った偶数・奇数の判定
        // num を 2 で割った余り (0 or 1) を case のキーとして使う
        switch (num % 2) {
            case 0:
                System.out.println("Even"); // 余りが 0 の場合は偶数
                break;
            case 1:
                System.out.println("Odd"); // 余りが 1 の場合は奇数
                break;
        }

        // 演習3: 1～10 の範囲で偶数のみを表示する for ループ
        // 1 から 10 までループし、偶数の場合のみ出力する
        for (int i = 1; i <= 10; i++) {
            if (i % 2 == 0) { // i を 2 で割った余りが 0 のとき（偶数）
                System.out.print(i + " "); // 偶数を表示
            }
        }
    }
}