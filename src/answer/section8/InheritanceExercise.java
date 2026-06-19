package answer.section8;

import java.util.ArrayList;
import java.util.List;

// 演習1: Animal クラスを作成し、makeSound メソッドを定義する
class Animal {
    // makeSound メソッド: デフォルトの動物の鳴き声を出力
    public void makeSound() {
        System.out.println("Animal makes a sound");
    }
}

// 演習2: Animal クラスを継承する Dog クラスを作成し、makeSound メソッドをオーバーライドする
class Dog extends Animal {
    // makeSound メソッド: 犬特有の鳴き声を出力
    @Override
    public void makeSound() {
        System.out.println("Bark!");
    }
}

// メインクラス
public class InheritanceExercise {
    public static void main(String[] args) {
        // 演習3: Animal の List を作成し、その中に Animal と Dog のインスタンスを追加する
        List<Animal> animals = new ArrayList<>();
        animals.add(new Animal()); // Animal のインスタンス
        animals.add(new Dog());    // Dog のインスタンス (Animal を継承)

        // 演習3: List 内の各インスタンスの makeSound メソッドを呼び出す
        for (Animal animal : animals) {
            animal.makeSound(); // ポリモーフィズムにより適切なメソッドが実行される
        }
    }
}

