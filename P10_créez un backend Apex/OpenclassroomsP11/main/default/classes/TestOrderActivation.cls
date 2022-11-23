@isTest

public class TestOrderActivation {
    @isTest static void Test() {
        // create an account to which the order is related
        Account acc = new Account (Name= 'Test account');
        insert acc;

       // create the order
       Order o1 = new Order (AccountId = acc.Id,Status ='Draft',EffectiveDate = date.today());
       insert o1;
        
      
       Boolean thereIsException = false;
       try{        
       // Test execution
       		Test.startTest();
       		o1.Status ='Activated';
       		update o1;
      		Test.stopTest();
        } catch(Exception e){
            thereIsException = true;
        }
       // Dans ce cas l'order n'a pas d'order Item, il y a bien une exception, l'erreur est déclenchée 
       System.assert(thereIsException == true);
     
    }

}