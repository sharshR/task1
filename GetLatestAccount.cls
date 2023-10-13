public class GetLatestAccount {
    @AuraEnabled(cacheable=true)
    public static list<Account> getAccount(){
        list<Account> accList=[Select Id,Name,Industry,Number_Of_Contacts__c  From Account  order by CreatedDate desc Limit 10];
        return accList;
    }
}