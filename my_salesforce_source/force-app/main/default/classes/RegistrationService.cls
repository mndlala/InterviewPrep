public class RegistrationService {

    // -----------------------------
    // PUBLIC ENTRY POINT
    // -----------------------------
    public Id register(RegistrationRequestDto request) {

        // 1. Validate request
        validateRequest(request);

        // 2. Check for duplicates
        Lead existingLead = findExistingLead(request.email);

        if (existingLead != null) {
            return existingLead.Id;
        }

        // 3. Map DTO → Lead
        Lead leadToCreate = mapToLead(request);

        // 4. Insert Lead
        insert leadToCreate;

        return leadToCreate.Id;
    }

    // -----------------------------
    // VALIDATION LAYER
    // -----------------------------
    private void validateRequest(RegistrationRequestDto request) {

        if (request == null) {
            throw new RegistrationException('Request cannot be null');
        }

        if (!request.isValid()) {
            throw new RegistrationException('Invalid registration data');
        }

        if (String.isBlank(request.email)) {
            throw new RegistrationException('Email is required');
        }
    }

    // -----------------------------
    // DUPLICATE CHECK
    // -----------------------------
    private Lead findExistingLead(String email) {

        List<Lead> leads = [
            SELECT Id, Email
            FROM Lead
            WHERE Email = :email
            LIMIT 1
        ];

        return leads.isEmpty() ? null : leads[0];
    }

    // -----------------------------
    // MAPPING LAYER
    // -----------------------------
    private Lead mapToLead(RegistrationRequestDto request) {

        Lead l = new Lead();

        l.FirstName = request.firstName;
        l.LastName = request.lastName;
        l.Email = request.email;
        l.MobilePhone = request.mobilePhone;

        // custom fields (you created earlier conceptually)
        //l.Preferred_Currency__c = request.preferredCurrency;
        //l.Monthly_Income__c = request.monthlyIncome;

        l.LeadSource = 'LWR_PORTAL';
        l.Status = 'New';

        return l;
    }
}