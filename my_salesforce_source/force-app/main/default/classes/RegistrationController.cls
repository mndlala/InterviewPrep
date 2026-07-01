public with sharing class RegistrationController {
	
    @AuraEnabled
    public static Id register(Map<String, Object> request) {
        System.debug('==== ENTERED CONTROLLER ====');
        try {
            RegistrationRequestDto dto = new RegistrationRequestDto();

            dto.firstName = (String) request.get('firstName');
            dto.lastName = (String) request.get('lastName');
            dto.email = (String) request.get('email');
            dto.mobilePhone = (String) request.get('mobilePhone');
        
            RegistrationService service = new RegistrationService();
            return service.register(dto);
            /*RegistrationService service = new RegistrationService();
			
            return service.register(request);*/

        } catch (Exception ex) {
			
            // Important: keep error clean for LWC
            throw new AuraHandledException(
                'Registration failed: ' + ex.getMessage()
            );
        }
    }
}