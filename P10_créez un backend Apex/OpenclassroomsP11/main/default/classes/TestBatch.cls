@isTest(SeeAllData=false)

private class TestBatch{
    @testSetup
    static void init(){
        Account a = new Account(Name ='test batch');
        insert a;
        
    }
    @isTest static void Test() {
        Test.startTest();
        EmptyAccountTask MyBatch = new EmptyAccountTask(); 
        database.executebatch(MyBatch);
        Test.stopTest();
        Account a = [SELECT Id FROM Account WHERE Name ='test batch'];
        List <Task> t = [SELECT Id, WhatId,Subject FROM Task WHERE WhatId =: a.Id];
        System.assertEquals(t.size(),1);
        System.assertEquals(t.get(0).Subject, 'Call');
    }
}