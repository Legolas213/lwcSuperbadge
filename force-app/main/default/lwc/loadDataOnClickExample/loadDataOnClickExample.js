import { LightningElement, track } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';
export default class LoadDataOnClickExample extends LightningElement {
@track accountList;

handleLoad(){
    getAccounts()
    .then(result => {
        this.accountList = result;
    })
}

}