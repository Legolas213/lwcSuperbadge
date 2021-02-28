public with sharing class AccountController {
    public AccountController() {
        
    }
    
    @AuraEnabled
    public static List<Account> getAccounts(){
        return [SELECT Id,Name FROM Account];
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsByName(String searchKey){
        String name = '%' + searchKey + '%';
        return [SELECT Id,Name FROM Account WHERE Name LIKE :name];
    }
    
    @AuraEnabled
    public static void createChatterPost(String pdfBlobString){
        FeedItem item = new FeedItem();
        item.Title = 'FEED TITLE';
        item.ParentId = '0050o00000YXIDxAAP';
        item.Body = 'Sample Body';
        item.NetworkScope = '0DB0o000000GrXnGAK';
        insert item;
        ContentVersion cVer = new ContentVersion();
        cVer.VersionData = Blob.valueOf(pdfBlobString);
        cVer.Title = 'PDF TITLE';
        cVer.PathOnClient = 'SASA';
        insert cVer;
        FeedAttachment fa = new FeedAttachment();
        //fa.Title = 'ATTACH MENT';
        fa.FeedEntityId = item.Id;
        fa.Type = 'Content';
        fa.RecordId = cVer.Id;
        insert fa;
    }
    
    @AuraEnabled
    public static void attachPDF(){
        PageReference pageReference = new PageReference('/apex/TestPageOne');
        pageReference.getParameters().put('accountId','0010o00002D4kyE');
        Blob pdf = pageReference.getContentAsPDF();
        if(pdf != null){
            AccountController.testt(pdf);            
        }
    }
    
    public static void testt(Blob pdf){
        SYstem.debug('FUNCTIONNNNNN');
        FeedItem item = new FeedItem();
        item.Title = 'Chatter User Test';
        item.ParentId = '0050o00000YXIl1';
        item.Body = 'Sample Body 111';
        item.NetworkScope = '0DB0o000000GrXnGAK';
        insert item;
        ContentVersion cVer = new ContentVersion();
        cVer.VersionData = pdf;
        cVer.Title = 'PDF TITLE';
        cVer.PathOnClient = 'SASA';
        insert cVer;
        FeedAttachment fa = new FeedAttachment();
        fa.FeedEntityId = item.Id;
        fa.Type = 'Content';
        fa.RecordId = cVer.Id;
        insert fa;
    }
    
    public static void createSurveyInvite(){
        Survey sur = [SELECT ID FROM Survey WHERE ID='0Kd0o0000008Zzq'];
        SurveyInvitation inv = New SurveyInvitation();
		//inv.userId = '0050o00000YXIl1';
    }
    
}