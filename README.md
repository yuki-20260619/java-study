# Java学習

Javaの学習記録をGitHubにまとめています。

## 学習目的

- 開発寄りのキャリアを目指す
- ポートフォリオ作成
- Javaの基礎力を身につける

## 学習環境

- Windows 11
- IntelliJ IDEA
- OpenJDK 21
- Git / GitHub

## 学習記録

### Day01（2026/06/19）
クラスとオブジェクト

学習内容

- クラスの作成
- フィールド
- メソッド
- オブジェクト生成
- Productクラス
- Employeeクラス

フォルダ

```
src/study/day01_20260619
```

---

### Day02（2026/06/20）
コンストラクタとカプセル化

学習内容

- コンストラクタ
- private
- getter / setter
- raiseSalary()
- transferDepartment()
- 不正値チェック

フォルダ

```
src/study/day02_20260620
```

---

## Day3（2026/06/21）

### 学習内容

- 配列（Employee[]）
- for文による繰り返し処理
- ArrayList
- add()
- get()
- size()
- 合計値の計算
- 最大値の探索

### 実装した機能

- 従業員データを配列で管理
- for文による全件表示
- ArrayListへの従業員追加
- ArrayList全体の表示
- 給与合計の計算
- 最高給与の取得

### 学んだこと

配列は要素数が固定であるのに対し、
ArrayListは要素数を動的に増減できる。

また、for文と組み合わせることで、

- 一覧表示
- 合計値の計算
- 最大値の探索

など、実務でよく使われる集計処理の基本的な考え方を学んだ。

### 使用した主な構文

```java
Employee[] employees = new Employee[4];

ArrayList<Employee> employees = new ArrayList<>();

employees.add(...);

employees.get(i);

employees.size();

for (int i = 0; i < employees.size(); i++) {
    ...
}
```

フォルダ

```
src/study/day03_20260621
src/study/day03_20260621_2
```

---

## 今後学習予定

- Day04：継承
- Day05：ポリモーフィズム
- Day06：例外処理
- Day07：標準ライブラリ
- Day08：ファイル操作
- Day09：簡単なアプリ作成

---

継続して更新予定。
