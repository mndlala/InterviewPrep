import { LightningElement, track } from 'lwc';
import register from '@salesforce/apex/RegistrationController.register';

export default class CustomerOnboarding extends LightningElement {

    @track form = {
        firstName: '',
        lastName: '',
        email: '',
        mobilePhone: ''
    };

    @track message;
    @track error;

    handleChange(event) {
        const field = event.target.name;
        this.form[field] = event.target.value;
    }

    async handleSubmit() {
        this.message = null;
        this.error = null;

        try {
            const leadId = await register({ request: this.form });

            this.message = 'Thank you for registering. Reference: ' + leadId;

            // reset form
            this.form = {
                firstName: '',
                lastName: '',
                email: '',
                mobilePhone: ''
            };

        } catch (e) {
            this.error = e.body?.message || 'Registration failed. Please try again.';
        }
    }
}