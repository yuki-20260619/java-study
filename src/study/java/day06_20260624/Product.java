package study.java.day06_20260624;
// day05からコピー
public class Product {
    protected String name;
    protected int price;
    protected int stock;

    // コンストラクタ
    public Product(String name, int price, int stock) {
        this.name = name;
        this.price = price;
        this.stock = stock;
    }

    // getter：day06課題４・５で作成
    public int getPrice() {
        return price;
    }
    public String getName() {
            return name;
    }

    public void showInfo() {
        System.out.println("商品名：" + name);
        System.out.println("価格：" + price + "円");
        System.out.println("在庫：" + stock + "個");
    }
}
