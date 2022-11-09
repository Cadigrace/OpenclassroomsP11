@isTest

public class TestOrderActivation {
    @isTest static void Test() {
        // create an account to which the order is related
        Account acc = new Account (Name= 'Test account');
        insert acc;

       // create the order
       Order o1 = new Order (AccountId = acc.Id,Status ='Draft',EffectiveDate = date.today());
       insert o1;
        
        //create a product
        //Product2 pdt = new Product2(Name ='Test Product');
        //insert pdt;
        
        //Create the PricebookEntry
        //PricebookEntry pbe = new PricebookEntry(
        //Pricebook2Id = System.Test.getStandardPricebookId(),
       // Product2Id = pdt.Id,
       	//UnitPrice = 150,
        //IsActive = true
        //);
        //insert pbe;
        
       //create an order item related to order o1
       
       Boolean thereIsException = false;
       try{        
       // Exécution du test
       		Test.startTest();
       		o1.Status ='Activated';
       		update o1;
      		Test.stopTest();
        } catch(Exception e){
            thereIsException = true;
        }
       // Dans ce cas l'order n'a pas d'order Item, l'activation devrait être stoppée par le Trigger 
       System.assert(thereIsException == true);
      // System.assert(o1.getErrors().size() > 0);
     // System.assertEquals('An order without order item cannot be activated.',
                            // result.getErrors()[0].getMessage());
    }

}