import { LightningElement, track, wire } from 'lwc';
import getAccount from '@salesforce/apex/GetLatestAccount.getAccount';
export default class DisplayLatestAccount extends LightningElement {
    @track accounts;
    @track error;

    @wire(getAccount)
    wiredAccount({ data, error }) {
        if (data) {
            this.accounts = data;
        } else if (error) {
            console.log('error occured')
        }
    }

}