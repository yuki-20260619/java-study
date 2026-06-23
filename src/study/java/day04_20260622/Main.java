package study.java.day04_20260622;
import java.util.ArrayList;

public class Main {
    public static void main(String[] arg) {
        ArrayList<Product> products = new ArrayList<>();

        products.add(new Product("マウス",2500,10));
        products.add(new Product("キーボード",5000,5));
        products.add(new Product("モニター",30000,2));

        // 課題１：for文で全商品を表示
        System.out.println("課題１：for文で全商品を表示");

        for (int i =0; i < products.size(); i++) {
            products.get(i).showInfo();
            System.out.println();
        }

        // 課題２：商品を追加
        System.out.println("課題２：商品を追加する");
        products.add(new Product("USBメモリ",1500,8));
         for (int i =0; i < products.size(); i++) {
             products.get(i).showInfo();
             System.out.println();
         }

         // 課題３：商品の合計金額を取得する
        System.out.println("課題３：商品の合計金額を取得する");

         int totalPrice = 0;
         int getPrice =0;

         for (int i = 0; i < products.size(); i++) {
             getPrice = products.get(i).getPrice();
             totalPrice += getPrice;
         }

         System.out.println("価格合計：" + totalPrice + "円");
         System.out.println();

         // 課題４：一番高い商品を取得する
        System.out.println("課題４：一番高い商品を取得する");

        int maxPrice = 0;
        getPrice = 0;
        String maxProductName = "";
        String getProductName = "";

        for(int i = 0; i < products.size(); i++) {
            getPrice = products.get(i).getPrice();
            getProductName = products.get(i).getName();

            if(getPrice > maxPrice) {
                maxPrice = getPrice;
                maxProductName = getProductName;
            }
        }
        System.out.println("最高価格の商品：" + maxProductName);
        System.out.println("価格：" + maxPrice + "円");
        System.out.println();
    }
}
