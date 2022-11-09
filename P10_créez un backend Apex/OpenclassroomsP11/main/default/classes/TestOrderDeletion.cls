@isTest

public class TestOrderDeletion {
    @isTest static void Test(){
        //Account creation
        Account acc = new Account(Name ='Test account',Active__c = 'Yes');
        insert acc;
        
        //Order creation
        Order od = new Order(AccountId = acc.Id,Status ='Draft',EffectiveDate = date.today());
        insert od;
        
        //Perform test
        Test.startTest();
        Database.DeleteResult result = Database.delete(od, false);
        //delete od;
        Test.stopTest();
		//System.assertNotEquals('Yes',acc.Active__c);
		Account a = [SELECT Id, Active__c FROM Account WHERE Name ='Test account'];
        System.assertEquals('No',a.Active__c);
        
        
       
        
        
        
    }

}