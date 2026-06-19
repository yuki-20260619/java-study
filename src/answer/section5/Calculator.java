package answer.section5;

// Calculator クラスを作成し、整数の和を計算するメソッドを実装する
class Calculator {
    // 演習1: 2つの整数を受け取り、その和を返す sum メソッドを作成する
    int sum(int a, int b) {
        return a + b; // 2つの整数の合計を返す
    }

    // 演習3: sum メソッドをオーバーロードし、3つの整数の和を求められるようにする
    int sum(int a, int b, int c) {
        return a + b + c; // 3つの整数の合計を返す
    }
}