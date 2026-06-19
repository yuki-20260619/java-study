package answer.section7;

import java.util.ArrayList;
import java.util.HashMap;

public class CollectionExercise {
    public static void main(String[] args) {
        // 演習1: ArrayList<Integer> を作成し、10, 20, 30, 40, 50 を追加する
        // ArrayList は可変長のリストで、要素を自由に追加・削除できる
        ArrayList<Integer> numbers = new ArrayList<>();
        numbers.add(10);
        numbers.add(20);
        numbers.add(30);
        numbers.add(40);
        numbers.add(50);

        // 演習2: 拡張 for 文を使って、ArrayList の全要素を表示する
        // 拡張 for 文は、配列やコレクションの全要素を順番に処理するときに便利
        System.out.println("ArrayList の要素:");
        for (int num : numbers) {
            System.out.println(num);
        }

        // 演習3: HashMap<String, Integer> を作成し、キーと値のペアを追加する
        // HashMap はキーと値のペアを格納するコレクション
        HashMap<String, Integer> priceMap = new HashMap<>();
        priceMap.put("apple", 100);
        priceMap.put("banana", 200);
        priceMap.put("orange", 150);

        // 演習4: 作成した HashMap から "banana" の値を取得し、表示する
        // get() メソッドを使って、指定したキーの値を取得する
        int bananaPrice = priceMap.get("banana");
        System.out.println("banana の価格: " + bananaPrice);
    }
}


