public with sharing class RegistrationController {
	
    @AuraEnabled
    public static Id register(RegistrationRequestDto request) {

        try {
            RegistrationService service = new RegistrationService();

            return service.register(request);

        } catch (Exception ex) {

            // Important: keep error clean for LWC
            throw new AuraHandledException(
                'Registration failed: ' + ex.getMessage()
            );
        }
    }
}