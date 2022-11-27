public with sharing class OrderService {
    
    public static void checkOrderActivation(Order o){
    	if (o.Status == 'Activated'){
       		List <OrderItem> orderItems = [SELECT Id FROM OrderItem WHERE OrderId = :o.Id];
        	if (orderItems.isEmpty()){
            	o.addError('An order without order item cannot be activated');
            }    
        }
    }
    
    public static void checkOrderDeletion(Order od){
		List <Order> orders =[SELECT Id FROM Order WHERE AccountId =: od.AccountId];
        if (orders.isEmpty()){
        	Account a = [SELECT Id, Active__c FROM Account WHERE Id =: od.AccountId];
           	a.Active__c = false;
            update a;
        }

    }
    
	
}