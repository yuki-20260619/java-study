package answer.section4;

// メインクラス
public class CarExercise {
    public static void main(String[] args) {
        // 演習3: Car クラスのインスタンスを作成し、brand を "Toyota" に設定
        Car myCar = new Car("Toyota"); // Toyota ブランドの車を作成

        // 現在の状態を表示
        System.out.println("加速前:");
        myCar.showInfo();

        // accelerate メソッドを呼び出して速度を変更
        myCar.accelerate(); // 速度を 10 増加

        // 加速後の状態を表示
        System.out.println("加速後:");
        myCar.showInfo();
    }
}
