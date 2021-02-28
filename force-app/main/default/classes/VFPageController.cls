public class VFPageController {
    
    public String accountId{get;set;}
    
    public Account account{get;set;}
    
    public Blob pdf{get;set;}
    
    public VFPageController(){
        PageReference pageReference = System.currentPageReference();
        this.accountId = pageReference.getParameters().get('accountId');
        if(accountId != null){
            Account acc = [SELECT ID,Name,AccountNumber FROM Account WHERE Id=:accountId];
            this.account = acc;
        }
        //this.pdf = pageReference.getContentAsPDF();
    }
    
    public void attachPDF(){
        SYstem.debug('FUNCTIONNNNNN');
        FeedItem item = new FeedItem();
        item.Title = 'Chatter User Test';
        item.ParentId = '0050o00000YXIl1';
        item.Body = 'Sample Body 5443';
        item.NetworkScope = '0DB0o000000GrXnGAK';
        insert item;
        PageReference pageReference = new PageReference('/apex/TestPageOne');
        pageReference.getParameters().put('accountId','0010o00002D4kyE');
        ContentVersion cVer = new ContentVersion();
        cVer.VersionData = pageReference.getContentAsPDF();
        cVer.Title = 'PDF TITLE';
        cVer.PathOnClient = 'SASA';
        insert cVer;
        FeedAttachment fa = new FeedAttachment();
        fa.FeedEntityId = item.Id;
        fa.Type = 'Content';
        fa.RecordId = cVer.Id;
        insert fa;
    }
    
    public void getContent(){
        PageReference pageReference = new PageReference('https://sncr-dev-ed--c.visualforce.com/apex/TestPageOne?accountId=0010o00002D4kyE');
        this.pdf =  pageReference.getContentAsPDF();
    }

}