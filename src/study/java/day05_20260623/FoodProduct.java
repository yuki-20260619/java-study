package study.java.day05_20260623;

public class FoodProduct extends Product {
    private String expirationDate;

    // コンストラクタ
    public FoodProduct(String name, int price, int stock, String expirationDate) {
       super(name, price, stock);
       this.expirationDate=expirationDate;
    }

    public void showFoodInfo() {
        showInfo();
        System.out.println("賞味期限：" + expirationDate);
    }

    @Override
    public void showInfo() {
        super.showInfo();
        System.out.println("賞味期限：" + expirationDate);
    }
}
