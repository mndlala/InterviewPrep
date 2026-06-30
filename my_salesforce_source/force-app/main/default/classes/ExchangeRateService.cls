public with sharing class ExchangeRateService implements IExchangeRateService {

    private static final String BASE_ENDPOINT =
        'https://open.er-api.com/v6/latest/';

    private IHttpGetService httpGetService;

    public ExchangeRateService(IHttpGetService httpGetService) {
        this.httpGetService = httpGetService;
    }

    public ExchangeRateService() {
        this.httpGetService = new HttpGetService();
    }

    // -----------------------------
    // Get single rate
    // -----------------------------
    public Decimal getRate(String fromCurrency, String toCurrency) {

        HttpModal modal = new HttpModal();
        modal.endpoint = BASE_ENDPOINT + fromCurrency;
        modal.useNamedCredential = false;

        HttpResponse res = httpGetService.HttpGet(modal);

        if (res.getStatusCode() != 200) {
            throw new CalloutException('Failed to fetch exchange rate');
        }

        Map<String, Object> data =
            (Map<String, Object>) JSON.deserializeUntyped(res.getBody());

        Map<String, Object> rates =
            (Map<String, Object>) data.get('rates');

        return (Decimal) rates.get(toCurrency);
    }

    // -----------------------------
    // Get all rates
    // -----------------------------
    public Map<String, Decimal> getAllRates(String baseCurrency) {

        HttpModal modal = new HttpModal();
        modal.endpoint = BASE_ENDPOINT + baseCurrency;
        modal.useNamedCredential = false;

        HttpResponse res = httpGetService.HttpGet(modal);

        if (res.getStatusCode() != 200) {
            throw new CalloutException(
                'Failed to fetch exchange rates for ' + baseCurrency
            );
        }

        Map<String, Object> response =
            (Map<String, Object>) JSON.deserializeUntyped(res.getBody());

        Map<String, Object> ratesRaw =
            (Map<String, Object>) response.get('rates');

        Map<String, Decimal> rates = new Map<String, Decimal>();

        for (String key : ratesRaw.keySet()) {
            rates.put(key, (Decimal) ratesRaw.get(key));
        }
        return rates; 
    }
}