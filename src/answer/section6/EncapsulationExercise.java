package answer.section6;

// メインクラス
public class EncapsulationExercise {
    public static void main(String[] args) {
        // 演習3: Person クラスのインスタンスを作成する
        Person person = new Person("Unknown", 25); // 初期値を設定

        // 現在の名前を表示する
        System.out.println("変更前の名前: " + person.getName());

        // 演習3: setter を使って name を "Alice" に設定する
        person.setName("Alice");

        // 演習3: getter を使って name を取得し、表示する
        System.out.println("変更後の名前: " + person.getName());
    }
}
