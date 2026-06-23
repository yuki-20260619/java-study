package study.java.day05_20260623;

public class ElectronicProduct extends Product {
    private int warrantyMonths;

    // コンストラクタ
    public ElectronicProduct(
            String name,
            int price,
            int stock,
            int warrantyMonths) {
        super(name, price, stock);

        this.warrantyMonths = warrantyMonths;
    }

    public void showElectronicInfo() {
        showInfo();
        System.out.println("保証期間：" + warrantyMonths + "か月");
    }

    @Override
    public void showInfo() {
        super.showInfo();
        System.out.println("保証期間：" + warrantyMonths + "か月");
    }
}
