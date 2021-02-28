import { LightningElement, track } from 'lwc';

export default class ToDoAppContainer extends LightningElement {

    @track
    itemName;

    @track
    allItems = [];

    handleAdd(){
        this.allItems.push(this.itemName);
        //console.log('Print',JSON.stringify(this.allItems));
        this.itemName = '';
    }
    handleChange(){
        this.itemName = event.target.value;
    }

}