package study.day01_20260619;

public class Product {
    // フィールド（データ）
    String name;
    int price;

    //　メソッド（操作）
    void showInfo() {
        System.out.println("商品名："+ name);
        System.out.println("価格：" + price + "円");
    }
}
