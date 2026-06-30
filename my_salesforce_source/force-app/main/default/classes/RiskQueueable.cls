public class RiskQueueable implements Queueable {

    private Id loanId;
    private Decimal income;

    public RiskQueueable(Id loanId, Decimal income) {
        this.loanId = loanId;
        this.income = income;
    }

    public void execute(QueueableContext context) {

        Integer retryCount = 0;
        Boolean success = false;
        Decimal score;

        while (retryCount < 3 && !success) {
            try {
                score = FakeRiskEngineService.calculateRisk(income);
                success = true;

            } catch (Exception e) {
                retryCount++;
                System.debug('Retry attempt: ' + retryCount);

                if (retryCount == 3) {
                    throw e;
                }
            }
        }

        Risk_Assessment__c risk = new Risk_Assessment__c();
        risk.Loan_Application__c = loanId;
        risk.Score__c = score;
        risk.Calculated_At__c = System.now();

        insert risk;
    }
}