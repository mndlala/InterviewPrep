public with sharing class LoanController {

    @AuraEnabled
    public static Loan_Application__c submitLoan(Loan_Application__c loan) {
        return new LoanService().submitLoan(loan);
    }
}