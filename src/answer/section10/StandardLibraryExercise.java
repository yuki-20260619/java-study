package answer.section10;

import java.util.Scanner; // ユーザー入力を受け取るためのライブラリ
import java.time.LocalDate; // 日付を取得するためのライブラリ

public class StandardLibraryExercise {
    public static void main(String[] args) {
        // 演習1: Scanner を使ってユーザーから名前を入力させ、その名前を表示する
        Scanner scanner = new Scanner(System.in); // Scanner オブジェクトを作成
        System.out.print("名前を入力してください: ");
        String name = scanner.nextLine(); // ユーザーの入力を取得
        System.out.println("こんにちは、" + name + " さん！"); // 入力された名前を表示

        // 演習2: StringBuilder を使い、"Java" という文字列の末尾に " Programming" を追加する
        StringBuilder sb = new StringBuilder("Java"); // StringBuilder オブジェクトを作成
        sb.append(" Programming"); // 文字列を追加
        System.out.println("作成された文字列: " + sb.toString()); // 結果を表示

        // 演習3: 現在の日付を LocalDate を使って取得し、表示する
        LocalDate today = LocalDate.now(); // 現在の日付を取得
        System.out.println("今日の日付: " + today); // 日付を表示

        // Scanner を閉じる
        scanner.close();
    }
}

