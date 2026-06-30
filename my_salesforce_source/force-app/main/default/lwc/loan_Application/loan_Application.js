import { LightningElement, track } from 'lwc';
import submitLoan from '@salesforce/apex/LoanController.submitLoan';

export default class LoanForm extends LightningElement {

    @track loan = {
        Amount__c: 0,
        Currency_Code__c: 'USD',
        Income__c: 0
    };

    handleChange(event) {
        this.loan[event.target.name] = event.target.value;
    }

    async handleSubmit() {
        try {
            const result = await submitLoan({ loan: this.loan });
            console.log('Loan Created:', result);
        } catch (error) {
            console.error(error);
        }
    }
}