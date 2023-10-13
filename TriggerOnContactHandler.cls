public class TriggerOnContactHandler {
    public static void totalNoOfContacts(list<Contact>updatedList,list<Contact>listToUpdate){
        set<Id>accIds=new set<Id>();
        list<account> accToBeUpdated=new list<account>();
        if(updatedList!=null){ 
            for(Contact con:updatedList){
                if(con.AccountId!=null){
                    accIds.add(con.AccountId);
                }
            }
        }
        if(listToUpdate!=null){ 
            for(Contact con:listToUpdate){
                if(con.AccountId!=null){
                    accIds.add(con.accountId);  
                }
            }
        }
        AggregateResult [] Results= [Select AccountId aci,count(Id) co
                                     From Contact Where AccountId =:accIds Group By accountId];
        
        for(AggregateResult ar:Results){
            account ac=new account();
            ac.id=(Id)ar.get('aci');
            ac.Number_Of_Contacts__c=(Integer)ar.get('co');
            accToBeUpdated.add(ac);
        }
        if(!accToBeUpdated.isEmpty()){
            update accToBeUpdated;
        }  
    }
}