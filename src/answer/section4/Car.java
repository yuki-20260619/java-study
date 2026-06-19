package answer.section4;

// Car クラスを作成する
class Car {
    // 演習1: フィールド（インスタンス変数）brand（ブランド）と speed（速度）を定義
    private String brand; // 車のブランドを保持する
    private int speed;    // 現在の速度を保持する

    // コンストラクタ: brand を設定し、speed を初期化
    public Car(String brand) {
        this.brand = brand; // brand フィールドに引数の値を設定
        this.speed = 0;     // 初期の速度は 0
    }

    // 演習2: speed を 10 増やす accelerate メソッドを定義
    public void accelerate() {
        this.speed += 10; // 現在の速度に 10 を加算
    }

    // 現在の車の情報を表示するメソッド
    public void showInfo() {
        System.out.println("ブランド: " + this.brand);
        System.out.println("速度: " + this.speed + " km/h");
    }
}
