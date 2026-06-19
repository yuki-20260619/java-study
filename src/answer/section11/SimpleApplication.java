package answer.section11;

import java.util.Scanner; // ユーザー入力を受け取るためのライブラリ

public class SimpleApplication {
    public static void main(String[] args) {
        // 演習1: コンソールで "Hello, Java!" と表示する
        System.out.println("Hello, Java!"); // 画面にメッセージを表示

        // 演習2: Scanner を使って、ユーザーに名前を入力させ、その名前で挨拶する
        Scanner scanner = new Scanner(System.in); // Scanner オブジェクトを作成
        System.out.print("あなたの名前を入力してください: ");
        String name = scanner.nextLine(); // ユーザーの入力を取得
        System.out.println("Hello, " + name + "!"); // 入力された名前を表示

        // 演習3: while ループを使い、ユーザーが "exit" と入力するまで名前を聞き続ける
        String input;
        while (true) {
            System.out.print("もう一度名前を入力してください（終了するには 'exit' と入力）: ");
            input = scanner.nextLine(); // ユーザーの入力を取得
            if (input.equalsIgnoreCase("exit")) { // 入力が "exit"（大文字・小文字を区別しない）なら終了
                System.out.println("プログラムを終了します。");
                break;
            }
            System.out.println("Hello, " + input + "!"); // 入力された名前で挨拶
        }

        // Scanner を閉じる
        scanner.close();
    }
}


