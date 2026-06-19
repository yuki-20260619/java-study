package answer.section9;

public class ExceptionHandlingExercise {
    public static void main(String[] args) {
        // 演習1: 0で割り算を行うプログラム
        // この部分はエラーを確認するため、コメントアウト解除すると実行時に例外が発生する
        // int result = 10 / 0; // ArithmeticException 発生

        // 演習2: try-catch を使用し、例外発生時にメッセージを表示する
        try {
            int result = 10 / 0; // 0で割る → 例外発生
            System.out.println("計算結果: " + result);
        } catch (ArithmeticException e) {
            System.out.println("Cannot divide by zero"); // 例外時のメッセージ
        }

        // 演習3: throws を使って、例外を呼び出し元に伝える divide メソッドを作成
        try {
            int result = divide(10, 0);
            System.out.println("divideメソッドの結果: " + result);
        } catch (ArithmeticException e) {
            System.out.println("例外発生: " + e.getMessage());
        }
    }

    // 例外をスローするメソッド
    public static int divide(int a, int b) throws ArithmeticException {
        if (b == 0) {
            throw new ArithmeticException("0で割ることはできません"); // 例外をスロー
        }
        return a / b;
    }
}


