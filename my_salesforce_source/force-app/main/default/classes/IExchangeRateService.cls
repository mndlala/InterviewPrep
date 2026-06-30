public interface IExchangeRateService {
    Decimal getRate(String fromCurrency, String toCurrency);
    Map<String, Decimal> getAllRates(String baseCurrency);
}