package answer.section5;

// メインクラス
public class Main {
    public static void main(String[] args) {
        // Calculator のインスタンスを作成する
        Calculator calculator = new Calculator();

        // 演習2: sum メソッドを使って 3 と 7 の和を表示する
        int result1 = calculator.sum(3, 7);
        System.out.println("3 + 7 = " + result1); // 出力: 3 + 7 = 10

        // 演習4: sum メソッドのオーバーロードを使用し、3, 7, 5 の和を表示する
        int result2 = calculator.sum(3, 7, 5);
        System.out.println("3 + 7 + 5 = " + result2); // 出力: 3 + 7 + 5 = 15
    }
}
