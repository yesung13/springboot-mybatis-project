import java.util.Scanner;

public class AppTest {
    public static void main(String[] args) {
        System.out.println("===App Test===");
        Scanner sc = new Scanner(System.in);

        System.out.println("숫자입력: ");
        int num = sc.nextInt();
        System.out.println("\n결과: "+num);
    }
}
