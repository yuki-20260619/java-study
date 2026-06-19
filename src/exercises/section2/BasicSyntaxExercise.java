package exercises.section2;

public class BasicSyntaxExercise {
    public static void main(String[] args) {
        // 演習1: 整数型の変数 x を宣言し、10 を代入してください。
        int x = 10;
        // 演習2: x に 5 を足して、新しい変数 y に代入してください。
        int y = x + 5;
        // 演習3: y が 15 であるかどうかを boolean 型変数 isFifteen に格納してください。
        boolean isFifteen = (y == 15);
        // 結果を出力して確認してください。
        System.out.println("x = " + x);
        System.out.println("y = " + y);
        System.out.println("isFifteen = " + isFifteen);
    }
}
