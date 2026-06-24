package study.java.day06_20260624;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        // 食品：チョコレート・家電：モニターのオブジェクト作成
        Product product1 = new FoodProduct("チョコレート", 150, 20, "2026/12/31");
        Product product2 = new ElectronicProduct("モニター", 30000, 5, 36);

        // 配列を宣言
        ArrayList<Product> products = new ArrayList<>();

        // 商品オブジェクトを配列へ格納
        products.add(product1);
        products.add(product2);

        // 課題１：ポリモーフィズム
        System.out.println("課題１：ポリモーフィズム");

        for (Product product : products) {
            product.showInfo();
            System.out.println();
        }

        // 課題２：商品を追加する
        Product product3 = new FoodProduct(
                "クッキー",
                200,
                15,
                "2026/10/01"
        );

        products.add(product3);

        System.out.println("課題：２：商品を追加する");
        System.out.println("追加した商品");
        product3.showInfo();
        System.out.println();

        // 課題３：商品数と商品一覧を表示
        System.out.println("課題３：商品数と商品一覧を表示");
        System.out.println("商品数：" + products.size());

        for (Product product : products) {
            product.showInfo();
            System.out.println();
        }

        // 課題４：合計金額を求める
        System.out.println("課題４：合計金額を求める");

        int totalPrice = 0;

        for (Product product : products) {
            totalPrice += product.getPrice();
        }

        System.out.println("合計金額：" + totalPrice + "円");
        System.out.println();

        // 課題５：商品検索
        System.out.println("課題５：商品検索");
        final String keyName = "モニター";

        System.out.println("検索名は「 " + keyName + " 」です");
        for(Product product : products) {

            // "=="は同じ箱かの比較、"equals"は中身が同じかの比較の為コード変更
            //if(getName == keyName) {
            if(product.getName().equals(keyName)) {
                product.showInfo();
                System.out.println();
            }
        }

        // 課題６：商品種類を判定する
        System.out.println("課題６：商品種類判定");

        String targetName;

        for(Product product : products) {
            if(product instanceof FoodProduct) {
                targetName = product.getName();
                System.out.println(targetName + "：食品");
            } else if(product instanceof ElectronicProduct) {
                targetName = product.getName();
                System.out.println(targetName + "：家電");
            }
        }
        System.out.println();

        // 課題７：食品一覧と食品数を表示
        System.out.println("課題７：食品一覧と食品数を表示");

        int foodCount = 0;
        List<String> list = new ArrayList<>();

        for(Product product : products) {
            if(product instanceof FoodProduct) {
                list.add(product.getName());
                //foodCount += 1;
                foodCount++;
            }
        }

        String result = String.join(", ", list);
        System.out.println("食品の数は" + result + "の " + foodCount + "つ です。");
        System.out.println();
    }
}
