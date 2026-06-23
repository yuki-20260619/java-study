package study.java.day05_20260623;

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

    public void showInfo() {
        System.out.println("商品名：" + name);
        System.out.println("価格：" + price + "円");
        System.out.println("在庫：" + stock + "個");
    }
}
