package exercises.section3;

public class ControlFlowExercise {
    public static void main(String[] args) {
        // 演習1: 整数 num を受け取り、偶数なら "Even"、奇数なら "Odd" を表示する
        int num = 7;
        if (num % 2 == 0) {
            System.out.println("Even");
        } else {
            System.out.println("Odd");
        }
        // 演習2: 上記の処理を switch 文を使って書き換える（num % 2 をキーにする）
        switch (num % 2) {
            case 0:
                System.out.println("Even");
                break;
            case 1:
                System.out.println("Odd");
                break;
        }
        // 演習3: 1～10 の範囲で偶数だけを表示する for ループを書く
        for (int i = 1; i <= 10; i++) {
            if(i % 2 == 0) {
                System.out.print(i + " ");
            }
        }
    }
}
