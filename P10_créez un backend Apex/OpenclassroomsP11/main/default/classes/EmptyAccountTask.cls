public class EmptyAccountTask implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc){
        System.debug('execution de la methode start');
        //Collecte des tâches de type appel rattachées aux comptes dans TaskWhatIDs
        Set<Id> taskWhatIDs = new Set<Id>();
        List<Task> tasks = [SELECT WhatId FROM Task WHERE what.type = 'Account'AND Subject ='Call'];
        System.debug(tasks);
		for(Task t: tasks){
    		taskWhatIDs.add(t.WhatId);
		}
        //Récupération des Comptes sans Orders ni tâches associées
        
        List<Account> accs = [SELECT Id FROM Account WHERE Id not in(SELECT AccountId FROM Order) AND Id not in :taskWhatIDs];
        System.debug(accs);
    	return Database.getQueryLocator('SELECT Id FROM Account WHERE Id not in(SELECT AccountId FROM Order) AND Id not in :taskWhatIDs');    
    }
    
    public void execute(Database.BatchableContext bc, List<Account> scope){
        System.debug('Ici');
        System.debug(scope);
        for (Account acc:scope){
            Task t = new Task (Subject ='Call',Status ='Not Started',Priority ='Normal',WhatId = acc.Id);
            insert t;
        }
    }
    
    public void finish(Database.BatchableContext bc){
        
    }

}