package answer.section2;

public class BasicSyntaxExercise {
    public static void main(String[] args) {
        // 演習1: 整数型の変数 x を宣言し、10 を代入する
        // int は整数型のデータを格納する基本的な型
        int x = 10; // 変数 x を作成し、10 を代入する

        // 演習2: x に 5 を足して、新しい変数 y に代入する
        // x の現在の値 (10) に 5 を加算し、その結果を y に代入する
        int y = x + 5; // y = 10 + 5 → y = 15

        // 演習3: y が 15 であるかどうかを boolean 型変数 isFifteen に格納する
        // "==" は等価演算子で、y が 15 なら true、それ以外なら false になる
        boolean isFifteen = (y == 15); // y が 15 なら true、それ以外なら false

        // 結果を出力する
        // x, y, isFifteen の値をコンソールに表示して、正しく計算されていることを確認する
        System.out.println("x = " + x); // x の値を表示 (10)
        System.out.println("y = " + y); // y の値を表示 (15)
        System.out.println("isFifteen = " + isFifteen); // isFifteen の値を表示 (true)
    }
}
