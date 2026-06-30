public class LoanService {

    public Loan_Application__c submitLoan(Loan_Application__c loan) {


        Decimal rate = new ExchangeRateService(
            new HttpGetService()
        ).getRate(loan.Currency_Code__c, 'ZAR');

        loan.Normalized_Income__c = loan.Income__c * rate;

        insert loan;

        System.enqueueJob(
            new RiskQueueable(loan.Id, loan.Normalized_Income__c)
        );

        return loan;
    }
}