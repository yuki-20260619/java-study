package study.java.day05_20260623;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        FoodProduct food = new FoodProduct("チョコレート", 150, 20, "2026/12/31");

        // 課題１：継承
        // 継承のみを利用した表示。オーバーライド実装前のコードを学習記録として残す。
        System.out.println("課題１：継承");
        food.showFoodInfo();

        // 課題２：家電商品の継承
        // 継承のみを利用した表示。オーバーライド実装前のコードを学習記録として残す。
        ElectronicProduct monitor =
                new ElectronicProduct(
                "モニター",
                30000,
                5,
                36
                );

        System.out.println();
        System.out.println("課題２：家電商品の継承");

        monitor.showElectronicInfo();

        // 課題３：オーバーライド
        System.out.println();
        System.out.println("課題３：オーバーライド");

        food.showInfo();

        // 課題４：ArrayList
        System.out.println();
        System.out.println("課題４：ArrayList");
        ArrayList<Product> products = new ArrayList<>();

        products.add(food);
        products.add(monitor);

        for (Product product : products) {
            product.showInfo();
            System.out.println();
        }
    }
}
