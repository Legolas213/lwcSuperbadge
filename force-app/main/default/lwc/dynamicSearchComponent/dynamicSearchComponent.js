import { LightningElement , track} from 'lwc';
import findAccountsByName from '@salesforce/apex/AccountController.getAccountsByName';

//const DELAY = 300;
export default class DynamicSearchComponent extends LightningElement {

     @track searchKey = '';
     @track accounts;

    /*@wire(findAccountsByName, { searchKey: '$searchKey' })
    fetchedAccounts({data, error}){
        if(data){
            this.accounts = data;
            //this.error = undefined;
        }else if(error){
            this.accounts = undefined;
            //this.error = error;
        }
    }*/

    handleKeyChange(event) {
        // Debouncing this method: Do not update the reactive property as long as this function is
        // being called within a delay of DELAY. This is to avoid a very large number of Apex method calls.
        //window.clearTimeout(this.delayTimeout);
        //const searchKey = event.target.value;
        // eslint-disable-next-line @lwc/lwc/no-async-operation
        //this.delayTimeout = setTimeout(() => {
            //this.searchKey = searchKey;
        //}, DELAY);
        findAccountsByName({searchKey : event.target.value}).then(result =>{
            this.accounts = result;
        });
    }
}