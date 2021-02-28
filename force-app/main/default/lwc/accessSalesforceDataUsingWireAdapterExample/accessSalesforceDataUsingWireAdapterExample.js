import { LightningElement, wire, track } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';

export default class AccessSalesforceDataUsingWireAdapterExample extends LightningElement {
    @track accounts;
    @wire(getAccounts)
    getAccountList({data}){
        if(data){
            this.accounts = data;
        }
    }
    

}