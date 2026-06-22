package study.day04_20260622;

public class Product {
    // フィールド（データ）
    private String name;
    private int price;
    private int stock;

    // コンストラクタ
    public Product(String name, int price, int stock) {
        this.name = name;
        this.price = price;
        this.stock = stock;
    }

    // getter
    public String getName() { return this.name;}
    public int getPrice() { return this.price;}
    public int getStock() { return this.stock;}

    public void showInfo() {
        System.out.println("商品名：" + name);
        System.out.println("価格：" + price + "円");
        System.out.println("在庫：" + stock + "個");
    }
}
