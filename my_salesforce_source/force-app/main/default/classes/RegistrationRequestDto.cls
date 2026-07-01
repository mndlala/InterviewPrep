public class RegistrationRequestDto {
     @AuraEnabled
    public String firstName;
     @AuraEnabled
    public String lastName;
     @AuraEnabled
    public String email;
     @AuraEnabled
    public String mobilePhone;
     @AuraEnabled
    public Decimal monthlyIncome;
     @AuraEnabled
    public String preferredCurrency;
     @AuraEnabled
    public String source; 
     @AuraEnabled       
    public String country;
    

    public Boolean isValid() {

        if (String.isBlank(firstName)) return false;
        if (String.isBlank(lastName)) return false;
        if (String.isBlank(email)) return false;

        //if (monthlyIncome == null || monthlyIncome <= 0) return false;

        return true;
    }
    public String getFullName() {
        return firstName + ' ' + lastName;
    }
}