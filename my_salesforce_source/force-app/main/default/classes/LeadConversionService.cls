public with sharing class LeadConversionService implements ILeadConversionService {

    public Database.LeadConvertResult convert(Id leadId) {

        if (leadId == null) {
            throw new LeadConversionException('Lead Id cannot be null.');
        }

        Lead lead = [
            SELECT Id, IsConverted
            FROM Lead
            WHERE Id = :leadId
            LIMIT 1
        ];

        if (lead.IsConverted) {
            throw new LeadConversionException('Lead has already been converted.');
        }

        Database.LeadConvert lc = new Database.LeadConvert();

        lc.setLeadId(leadId);

        // Use your org's converted status
        lc.setConvertedStatus(getConvertedStatus());

        // Automatically create an Opportunity
        lc.setDoNotCreateOpportunity(false);

        Database.LeadConvertResult result =
            Database.convertLead(lc);

        if (!result.isSuccess()) {

            Database.Error error = result.getErrors()[0];

            throw new LeadConversionException(
                error.getStatusCode() + ' : ' + error.getMessage()
            );
        }

        return result;
    }

    private String getConvertedStatus() {

        LeadStatus status = [
            SELECT MasterLabel
            FROM LeadStatus
            WHERE IsConverted = true
            LIMIT 1
        ];

        return status.MasterLabel;
    }
}