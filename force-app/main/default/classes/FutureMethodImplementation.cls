global class FutureMethodImplementation {
    
    @future
    public static void updateNumberOfEmployees(List<Id> accountIds){
        List<Account> accounts = [SELECT ID,NumberOfEmployees FROM Account WHERE ID IN :accountIds];
        for(Account acc : accounts){
            acc.NumberOfEmployees = 10;
        }
        Database.update(accounts);
    }

}