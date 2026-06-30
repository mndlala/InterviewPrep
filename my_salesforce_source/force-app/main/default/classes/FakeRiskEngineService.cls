public class FakeRiskEngineService {

    public static Decimal calculateRisk(Decimal income) {

        Long start = DateTime.now().getTime();
        while (DateTime.now().getTime() - start < 2000) {}
        if (Math.mod(Crypto.getRandomInteger(), 10) < 3) {
            throw new CalloutException('Risk engine timeout');
        }

        return income > 50000 ? 90 : 40;
    }
}