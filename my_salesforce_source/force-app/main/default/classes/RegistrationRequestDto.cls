public class RegistrationRequestDto {
    public String firstName;
    public String lastName;
    public String email;
    public String mobilePhone;
    public Decimal monthlyIncome;
    public String preferredCurrency;
    public String source;        
    public String country;
    

    public Boolean isValid() {

        if (String.isBlank(firstName)) return false;
        if (String.isBlank(lastName)) return false;
        if (String.isBlank(email)) return false;

        if (monthlyIncome == null || monthlyIncome <= 0) return false;

        return true;
    }
    public String getFullName() {
        return firstName + ' ' + lastName;
    }
}