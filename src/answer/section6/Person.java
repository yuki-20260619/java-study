package answer.section6;

// Person クラスを定義する
class Person {
    // 演習1: フィールド name（名前）と age（年齢）を private にする
    private String name; // 名前を保持する
    private int age;     // 年齢を保持する

    // コンストラクタ: 名前と年齢を初期化する
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    // 演習2: name の getter メソッドを作成する
    public String getName() {
        return this.name; // name を取得する
    }

    // 演習2: name の setter メソッドを作成する
    public void setName(String name) {
        this.name = name; // name を設定する
    }

    // 年齢の getter メソッド（オプション）
    public int getAge() {
        return this.age; // age を取得する
    }

    // 年齢の setter メソッド（オプション）
    public void setAge(int age) {
        this.age = age; // age を設定する
    }
}
